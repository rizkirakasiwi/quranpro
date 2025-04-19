abstract class LocalStorageStrategy {
  Future<bool> save<T>(String storageName, String key, T data);
  Future<T?> get<T>(String storageName, String key);
  Future<bool> delete(String storageName, String key);
  Future<List<T>> getAll<T>(String storageName);
  Future<bool> saveList<T>(String storageName, String key, List<T> data);
  Future<List<T>> getList<T>(String storageName, String key);
}