import 'package:data/repository/helper/fetch_data_helper.dart';
import 'package:dependency/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:common/exception/client_error.dart';
import 'package:common/exception/server_error.dart';
import 'package:network/response/network_response.dart';

// Dummy model and entity
class DummyEntity extends Equatable {
  final String name;
  const DummyEntity(this.name);
  
  @override
  List<Object?> get props => [name];
}

class DummyModel extends Equatable {
  final String value;
  const DummyModel(this.value);
  
  @override
  List<Object?> get props => [value];
}

abstract class LocalSource {
  Future<List<DummyEntity>> getLocal();
  Future<bool> saveToLocal(List<DummyEntity> data);
}

abstract class RemoteSource {
  Future<NetworkResponse<List<DummyEntity>>> getRemote();
}

class MockLocal extends Mock implements LocalSource {}

class MockRemote extends Mock implements RemoteSource {}

void main() {
  late MockLocal mockLocal;
  late MockRemote mockRemote;
  late DummyEntity entity;

  setUp(() {
    mockLocal = MockLocal();
    mockRemote = MockRemote();
    entity = DummyEntity('entity');
  });

  DummyModel mapper(DummyEntity e) => DummyModel(e.name);

  test('returns Right from local when local data is available', () async {
    when(() => mockLocal.getLocal()).thenAnswer((_) async => [entity]);

    final result = await fetchWithLocalFallback<DummyEntity, DummyModel>(
      localFetch: mockLocal.getLocal,
      remoteFetch: mockRemote.getRemote, // won't be called
      mapper: mapper,
    );

    expect(result.isRight(), isTrue);
    expect(result.getRightOrNull(), [mapper(entity)]);
    verify(() => mockLocal.getLocal()).called(1);
    verifyNever(() => mockRemote.getRemote());
  });

  test('returns Right from remote and saves data locally', () async {
    when(() => mockLocal.getLocal()).thenAnswer((_) async => []);
    when(() => mockRemote.getRemote()).thenAnswer(
      (_) async => NetworkResponse(code: 200, status: 'OK', data: [entity]),
    );
    when(() => mockLocal.saveToLocal(any())).thenAnswer((_) async => true);

    final result = await fetchWithLocalFallback<DummyEntity, DummyModel>(
      localFetch: mockLocal.getLocal,
      remoteFetch: mockRemote.getRemote,
      mapper: mapper,
      saveToLocal: mockLocal.saveToLocal,
    );

    expect(result.isRight(), isTrue);
    expect(result.getRightOrNull(), [mapper(entity)]);
    verify(() => mockLocal.getLocal()).called(1);
    verify(() => mockRemote.getRemote()).called(1);
    verify(() => mockLocal.saveToLocal([entity])).called(1);
  });

  test('returns Left(ClientError) on 404', () async {
    when(() => mockLocal.getLocal()).thenAnswer((_) async => []);
    when(() => mockRemote.getRemote()).thenAnswer(
      (_) async => NetworkResponse(code: 404, status: 'Not Found', data: null),
    );

    final result = await fetchWithLocalFallback<DummyEntity, DummyModel>(
      localFetch: mockLocal.getLocal,
      remoteFetch: mockRemote.getRemote,
      mapper: mapper,
    );

    expect(result.isLeft(), isTrue);
    expect(result.getLeftOrNull(), isA<ClientError>());
  });

  test('returns Left(ServerError) on 500', () async {
    when(() => mockLocal.getLocal()).thenAnswer((_) async => []);
    when(() => mockRemote.getRemote()).thenAnswer(
          (_) async => NetworkResponse(code: 500, status: 'Server Error', data: null),
    );

    final result = await fetchWithLocalFallback<DummyEntity, DummyModel>(
      localFetch: mockLocal.getLocal,
      remoteFetch: mockRemote.getRemote,
      mapper: mapper,
    );

    expect(result.isLeft(), isTrue);
    expect(result.getLeftOrNull(), isA<ServerError>());
  });

  test('returns Left(ServerError) on exception', () async {
    when(() => mockLocal.getLocal()).thenThrow(Exception('local error'));

    final result = await fetchWithLocalFallback<DummyEntity, DummyModel>(
      localFetch: mockLocal.getLocal,
      remoteFetch: mockRemote.getRemote,
      mapper: mapper,
    );

    expect(result.isLeft(), isTrue);
    expect(result.getLeftOrNull(), isA<ServerError>());
  });
}
