import 'package:local_storage/helper/local_storage.dart';
import 'package:local_storage/helper/local_storage_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage/core/local_storage_strategy.dart';
import 'package:local_storage/core/local_storage_data.dart';

// Dummy class for testing
class FakeLocalStorageData extends Fake implements LocalStorageData {
  @override
  String get storageName => 'testBox';

  @override
  String get storageKey => 'testKey';
}

// Mock class
class MockLocalStorage extends Mock
    implements LocalStorageStrategy<LocalStorageData> {}

void main() {
  late MockLocalStorage mockStorage;
  late FakeLocalStorageData fakeData;
  late LocalStorage localStorage;

  setUp(() {
    mockStorage = MockLocalStorage();
    fakeData = FakeLocalStorageData();
    localStorage = LocalStorageImpl();
  });

  group('localStorageSave', () {
    test('returns true when storage.save succeeds', () async {
      when(() => mockStorage.save(fakeData)).thenAnswer((_) async => true);
      final result = await localStorage.save(fakeData, storage: mockStorage);
      expect(result, isTrue);
    });

    test('returns false when storage.save fails', () async {
      when(() => mockStorage.save(fakeData)).thenAnswer((_) async => false);
      final result = await localStorage.save(fakeData, storage: mockStorage);
      expect(result, isFalse);
    });
  });

  group('localStorageGet', () {
    test('returns data when storage.get succeeds', () async {
      when(
        () => mockStorage.get(fakeData.storageName, fakeData.storageKey),
      ).thenAnswer((_) async => fakeData);
      final result = await localStorage.get(fakeData, storage: mockStorage);
      expect(result, equals(fakeData));
    });

    test('returns null when storage.get fails', () async {
      when(
        () => mockStorage.get(fakeData.storageName, fakeData.storageKey),
      ).thenAnswer((_) async => null);
      final result = await localStorage.get(fakeData, storage: mockStorage);
      expect(result, isNull);
    });
  });

  group('localStorageDelete', () {
    test('returns true when storage.delete succeeds', () async {
      when(
        () => mockStorage.delete(fakeData.storageName, fakeData.storageKey),
      ).thenAnswer((_) async => true);
      final result = await localStorage.delete(fakeData, storage: mockStorage);
      expect(result, isTrue);
    });

    test('returns false when storage.delete fails', () async {
      when(
        () => mockStorage.delete(fakeData.storageName, fakeData.storageKey),
      ).thenAnswer((_) async => false);
      final result = await localStorage.delete(fakeData, storage: mockStorage);
      expect(result, isFalse);
    });
  });

  group('localStorageGetAll', () {
    test('returns a list of data', () async {
      when(
        () => mockStorage.getAll(fakeData.storageName),
      ).thenAnswer((_) async => [fakeData]);
      final result = await localStorage.getAll(fakeData, storage: mockStorage);
      expect(result, contains(fakeData));
    });

    test('returns empty list when storage.getAll fails', () async {
      when(
        () => mockStorage.getAll(fakeData.storageName),
      ).thenAnswer((_) async => []);
      final result = await localStorage.getAll(fakeData, storage: mockStorage);
      expect(result, isEmpty);
    });
  });

  group('localStorageGetList', () {
    test('returns a list of data', () async {
      when(
        () => mockStorage.getList(fakeData.storageName, fakeData.storageKey),
      ).thenAnswer((_) async => [fakeData]);
      final result = await localStorage.getList(fakeData, storage: mockStorage);
      expect(result, contains(fakeData));
    });

    test('returns empty list when storage.getList fails', () async {
      when(
        () => mockStorage.getList(fakeData.storageName, fakeData.storageKey),
      ).thenAnswer((_) async => []);
      final result = await localStorage.getList(fakeData, storage: mockStorage);
      expect(result, isEmpty);
    });
  });

  group('localStorageSaveList', () {
    test('returns true when saveList succeeds', () async {
      when(
        () => mockStorage.saveList(fakeData.storageName, fakeData.storageKey, [
          fakeData,
        ]),
      ).thenAnswer((_) async => true);
      final result = await localStorage.saveList([
        fakeData,
      ], storage: mockStorage);
      expect(result, isTrue);
    });

    test('returns false when saveList fails', () async {
      when(
        () => mockStorage.saveList(fakeData.storageName, fakeData.storageKey, [
          fakeData,
        ]),
      ).thenAnswer((_) async => false);
      final result = await localStorage.saveList([
        fakeData,
      ], storage: mockStorage);
      expect(result, isFalse);
    });
  });
}
