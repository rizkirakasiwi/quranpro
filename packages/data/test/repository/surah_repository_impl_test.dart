import 'package:common/exception/client_error.dart';
import 'package:common/exception/server_error.dart';
import 'package:data/datasource/local/local_surah_datasource.dart';
import 'package:data/datasource/remote/remote_surah_datasource.dart';
import 'package:data/entity/mapper/surah_entity_to_model.dart';
import 'package:data/entity/surah_entity.dart';
import 'package:data/repository/surah_repository_impl.dart';
import 'package:domain/repository/surah_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class MockRemoteSurahDatasource extends Mock implements RemoteSurahDatasource {}

class MockLocalSurahDatasource extends Mock implements LocalSurahDatasource {}

void main() {
  late RemoteSurahDatasource remote;
  late LocalSurahDatasource local;
  late SurahRepository sut;

  setUp(() {
    remote = MockRemoteSurahDatasource();
    local = MockLocalSurahDatasource();
    sut = SurahRepositoryImpl(remote: remote, local: local);
  });

  group('SurahRepositoryImpl', () {
    test(
      'should return list of SurahModel when local fetch is successful',
      () async {
        // Arrange
        final fakeEntities = [
          SurahEntity(
            number: 1,
            name: 'Al-Fatihah',
            englishName: 'The Opening',
          ),
          SurahEntity(number: 2, name: 'Al-Baqarah', englishName: 'The Cow'),
        ];

        when(() => local.getSurahList()).thenAnswer((_) async => fakeEntities);

        // Act
        final result = await sut.getAllSurah();

        // Assert
        expect(result.isRight(), isTrue);
        expect(
          result.getRightOrNull(),
          fakeEntities.map((e) => e.toModel()).toList(),
        );
        verify(() => local.getSurahList()).called(1);
        verifyNever(() => remote.getSurahList());
        verifyNever(() => local.saveSurahList(any()));
      },
    );

    test(
      'should return list of SurahModel from remote if local empty',
      () async {
        // Arrange
        final fallbackLocal = [
          SurahEntity(number: 1, name: 'Al-Fatihah'),
          SurahEntity(number: 2, name: 'Al-Baqarah'),
        ];

        final networkResponse = NetworkResponse(
          code: 200,
          status: 'OK',
          data: fallbackLocal,
        );

        when(() => local.getSurahList()).thenAnswer((_) async => []);
        when(
          () => remote.getSurahList(),
        ).thenAnswer((_) async => networkResponse);
        when(() => local.saveSurahList(any())).thenAnswer((_) async => true);

        // Act
        final result = await sut.getAllSurah();

        // Assert
        expect(result.isRight(), isTrue);
        expect(
          result.getRightOrNull(),
          fallbackLocal.map((e) => e.toModel()).toList(),
        );
        verify(() => remote.getSurahList()).called(1);
        verify(() => local.saveSurahList(any())).called(1);
        verify(() => local.getSurahList()).called(1);
      },
    );

    test(
      'should return Left(ClientError) when remote fetch 400',
          () async {
        // Arrange
        final networkResponse = NetworkResponse<List<SurahEntity>>(
          code: 400,
          status: 'Client Error',
          data: [],
        );

        when(() => local.getSurahList()).thenAnswer((_) async => []);
        when(
              () => remote.getSurahList(),
        ).thenAnswer((_) async => networkResponse);

        // Act
        final result = await sut.getAllSurah();

        // Assert
        expect(result.isLeft(), isTrue);
        expect(
          result.getLeftOrNull(),
          isA<ClientError>(),
        );
        expect(result.getLeftOrNull()?.getMessage(), networkResponse.status);
        verify(() => remote.getSurahList()).called(1);
        verifyNever(() => local.saveSurahList(any()));
        verify(() => local.getSurahList()).called(1);
      },
    );

    test(
      'should return Left(Server) when remote fetch 500',
          () async {
        // Arrange
        final networkResponse = NetworkResponse<List<SurahEntity>>(
          code: 500,
          status: 'Server Error',
          data: [],
        );

        when(() => local.getSurahList()).thenAnswer((_) async => []);
        when(
              () => remote.getSurahList(),
        ).thenAnswer((_) async => networkResponse);

        // Act
        final result = await sut.getAllSurah();

        // Assert
        expect(result.isLeft(), isTrue);
        expect(
          result.getLeftOrNull(),
          isA<ServerError>(),
        );
        expect(result.getLeftOrNull()?.getMessage(), networkResponse.status);
        verify(() => remote.getSurahList()).called(1);
        verifyNever(() => local.saveSurahList(any()));
        verify(() => local.getSurahList()).called(1);
      },
    );

    test('should return error when both remote and local fail', () async {
      // Arrange
      when(() => local.getSurahList()).thenAnswer((_) async => []);
      when(() => remote.getSurahList()).thenThrow(Exception('Network error'));

      // Act
      final result = await sut.getAllSurah();

      // Assert
      expect(result.isLeft(), isTrue);
      expect(result.getLeftOrNull(), isA<ServerError>());
      verify(() => remote.getSurahList()).called(1);
      verify(() => local.getSurahList()).called(1);
    });
  });
}
