import 'package:local_storage/core/local_storage_data.dart';
import 'package:local_storage/core/local_storage_strategy.dart';

abstract class LocalStorage {
  Future<bool> save<T>(String storageName, String key, T data, {LocalStorageStrategy strategy});
  Future<T?> get<T>(String storageName, String key, {LocalStorageStrategy strategy});
  Future<bool> delete(String storageName, String key, {LocalStorageStrategy strategy});
  Future<List<T>> getAll<T>(String storageName, {LocalStorageStrategy strategy});
  Future<bool> saveList<T>(String storageName, String key, List<T> data, {LocalStorageStrategy strategy});
  Future<List<T>> getList<T>(String storageName, String key, {LocalStorageStrategy strategy});

  Future<bool> saveObject<T extends LocalStorageData>(T data, {LocalStorageStrategy strategy});
  Future<T?> getObject<T extends LocalStorageData>(T data, {LocalStorageStrategy strategy});
  Future<bool> deleteObject<T extends LocalStorageData>(T data, {LocalStorageStrategy strategy});
  Future<List<T>> getAllObject<T extends LocalStorageData>(T data, {LocalStorageStrategy strategy});
  Future<bool> saveListObject<T extends LocalStorageData>(List<T> data, {LocalStorageStrategy strategy});
  Future<List<T>> getListObject<T extends LocalStorageData>(T data, {LocalStorageStrategy strategy});
}
