import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage/core/local_storage_data.dart';
import 'package:local_storage/core/local_storage_strategy.dart';
import 'package:local_storage/helper/local_storage_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockStorageStrategy extends Mock implements LocalStorageStrategy {}

class FakeLocalStorageData extends Fake implements LocalStorageData {
  @override
  String get storageName => 'testBox';

  @override
  String get storageKey => 'testKey';
}

void main() {
  late MockStorageStrategy mockStrategy;
  late LocalStorageImpl localStorage;
  late FakeLocalStorageData fakeData;

  setUpAll(() {
    registerFallbackValue(FakeLocalStorageData());
  });

  setUp(() {
    mockStrategy = MockStorageStrategy();
    localStorage = LocalStorageImpl();
    fakeData = FakeLocalStorageData();
  });

  group('LocalStorageImpl', () {
    test('saveObject should delegate to strategy and return true', () async {
      when(() => mockStrategy.save<FakeLocalStorageData>(
          any(), any(), any()))
          .thenAnswer((_) async => true);

      final result = await localStorage.saveObject(
        fakeData,
        strategy: mockStrategy,
      );

      expect(result, isTrue);
      verify(() => mockStrategy.save<FakeLocalStorageData>(
          'testBox', 'testKey', fakeData)).called(1);
    });


    test('getObject should delegate to strategy and return data', () async {
      when(
        () => mockStrategy.get<FakeLocalStorageData>(any(), any()),
      ).thenAnswer((_) async => fakeData);

      final result = await localStorage.getObject<FakeLocalStorageData>(
        fakeData,
        strategy: mockStrategy,
      );

      expect(result, equals(fakeData));
      verify(
        () => mockStrategy.get<FakeLocalStorageData>('testBox', 'testKey'),
      ).called(1);
    });

    test('deleteObject should delegate to strategy and return true', () async {
      when(
        () => mockStrategy.delete(any(), any()),
      ).thenAnswer((_) async => true);

      final result = await localStorage.deleteObject(
        fakeData,
        strategy: mockStrategy,
      );

      expect(result, isTrue);
      verify(() => mockStrategy.delete('testBox', 'testKey')).called(1);
    });

    test(
      'getAllObject should delegate to strategy and return a list',
      () async {
        final dataList = [fakeData];
        when(
          () => mockStrategy.getAll<FakeLocalStorageData>(any()),
        ).thenAnswer((_) async => dataList);

        final result = await localStorage.getAllObject<FakeLocalStorageData>(
          fakeData,
          strategy: mockStrategy,
        );

        expect(result, equals(dataList));
        verify(
          () => mockStrategy.getAll<FakeLocalStorageData>('testBox'),
        ).called(1);
      },
    );

    test(
      'saveListObject should delegate to strategy and return true',
      () async {
        final dataList = [fakeData];
        when(
          () =>
              mockStrategy.saveList<FakeLocalStorageData>(any(), any(), any()),
        ).thenAnswer((_) async => true);

        final result = await localStorage.saveListObject<FakeLocalStorageData>(
          dataList,
          strategy: mockStrategy,
        );

        expect(result, isTrue);
        verify(
          () => mockStrategy.saveList<FakeLocalStorageData>(
            'testBox',
            'testKey',
            dataList,
          ),
        ).called(1);
      },
    );

    test('getListObject should delegate to strategy and return list', () async {
      final dataList = [fakeData];
      when(
        () => mockStrategy.getList<FakeLocalStorageData>(any(), any()),
      ).thenAnswer((_) async => dataList);

      final result = await localStorage.getListObject<FakeLocalStorageData>(
        fakeData,
        strategy: mockStrategy,
      );

      expect(result, equals(dataList));
      verify(
        () => mockStrategy.getList<FakeLocalStorageData>('testBox', 'testKey'),
      ).called(1);
    });
  });
}
