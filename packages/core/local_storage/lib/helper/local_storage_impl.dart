import 'package:local_storage/core/core.dart';
import 'package:local_storage/helper/local_storage.dart';
import 'package:local_storage/library/hive_storage.dart';

class LocalStorageImpl implements LocalStorage {
  const LocalStorageImpl();

  @override
  Future<bool> delete(
    String storageName,
    String key, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.delete(storageName, key);
  }

  @override
  Future<bool> deleteObject<T extends LocalStorageData>(
    T data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.delete(data.storageName, data.storageKey);
  }

  @override
  Future<T?> get<T>(
    String storageName,
    String key, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.get(storageName, key);
  }

  @override
  Future<List<T>> getAll<T>(
    String storageName, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.getAll(storageName);
  }

  @override
  Future<List<T>> getAllObject<T extends LocalStorageData>(
    T data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.getAll(data.storageName);
  }

  @override
  Future<List<T>> getList<T>(
    String storageName,
    String key, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.getList(storageName, key);
  }

  @override
  Future<List<T>> getListObject<T extends LocalStorageData>(
    T data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.getList(data.storageName, data.storageKey);
  }

  @override
  Future<T?> getObject<T extends LocalStorageData>(
    T data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.get(data.storageName, data.storageKey);
  }

  @override
  Future<bool> save<T>(
    String storageName,
    String key,
    T data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.save(storageName, key, data);
  }

  @override
  Future<bool> saveList<T>(
    String storageName,
    String key,
    List<T> data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.saveList(storageName, key, data);
  }

  @override
  Future<bool> saveListObject<T extends LocalStorageData>(
    List<T> data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.saveList(
      data.first.storageName,
      data.first.storageKey,
      data,
    );
  }

  @override
  Future<bool> saveObject<T extends LocalStorageData>(
    T data, {
    LocalStorageStrategy strategy = const HiveStorage(),
  }) async {
    return await strategy.save(data.storageName, data.storageKey, data);
  }
}
