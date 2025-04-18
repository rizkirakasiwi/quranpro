import 'package:local_storage/helper/local_storage.dart';
import 'package:local_storage/library/hive_storage.dart';
import 'package:local_storage/core/local_storage_strategy.dart';
import 'package:local_storage/core/local_storage_data.dart';

class LocalStorageImpl implements LocalStorage {
  const LocalStorageImpl();

  @override
  Future<bool> save(
    LocalStorageData data, {
    LocalStorageStrategy storage = const HiveStorage(),
  }) async {
    return await storage.save(data);
  }

  @override
  Future<T?> get<T extends LocalStorageData>(
    LocalStorageData storageKey, {
    LocalStorageStrategy storage = const HiveStorage(),
  }) async {
    final result = await storage.get(
      storageKey.storageName,
      storageKey.storageKey,
    );
    return result as T?;
  }

  @override
  Future<bool> delete(
    LocalStorageData data, {
    LocalStorageStrategy storage = const HiveStorage(),
  }) async {
    return await storage.delete(data.storageName, data.storageKey);
  }

  @override
  Future<List<T>> getAll<T extends LocalStorageData>(
    LocalStorageData data, {
    LocalStorageStrategy storage = const HiveStorage(),
  }) async {
    final result = await storage.getAll(data.storageName);
    return result.cast<T>();
  }

  @override
  Future<List<T>> getList<T extends LocalStorageData>(
    LocalStorageData data, {
    LocalStorageStrategy storage = const HiveStorage(),
  }) async {
    final result = await storage.getList(data.storageName, data.storageKey);
    return result.cast<T>();
  }

  @override
  Future<bool> saveList(
    List<LocalStorageData> data, {
    LocalStorageStrategy storage = const HiveStorage(),
  }) async {
    final first = data.first;
    return await storage.saveList(first.storageName, first.storageKey, data);
  }
}
