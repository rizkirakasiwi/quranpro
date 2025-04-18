import 'package:local_storage/core/local_storage_data.dart';
import 'package:local_storage/core/local_storage_strategy.dart';

abstract class LocalStorage {
  Future<bool> save(LocalStorageData data, {LocalStorageStrategy storage});

  Future<T?> get<T extends LocalStorageData>(
    LocalStorageData storageKey, {
    LocalStorageStrategy storage,
  });

  Future<bool> delete(LocalStorageData data, {LocalStorageStrategy storage});

  Future<List<T>> getAll<T extends LocalStorageData>(
    LocalStorageData data, {
    LocalStorageStrategy storage,
  });

  Future<List<T>> getList<T extends LocalStorageData>(
    LocalStorageData data, {
    LocalStorageStrategy storage,
  });

  Future<bool> saveList(
    List<LocalStorageData> data, {
    LocalStorageStrategy storage,
  });
}
