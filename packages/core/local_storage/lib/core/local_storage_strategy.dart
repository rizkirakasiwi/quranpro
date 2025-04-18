import 'package:local_storage/core/local_storage_data.dart';

/// A generic interface that defines operations for local storage systems
/// (e.g., Hive, SharedPreferences, etc.) for data types that implement [LocalStorageData].
///
/// This class supports saving, retrieving, deleting, and working with lists of data.
abstract class LocalStorageStrategy<T extends LocalStorageData> {
  /// Saves a single item into local storage using its defined [storageName] and [storageKey].
  ///
  /// Returns `true` if the save operation was successful, otherwise `false`.
  Future<bool> save(T data);

  /// Retrieves an item from local storage using the given [storageName] and [storageKey].
  ///
  /// Returns the corresponding item if found, or `null` if it does not exist or an error occurs.
  Future<T?> get(String storageName, String storageKey);

  /// Deletes an item from local storage using the given [storageName] and [storageKey].
  ///
  /// Returns `true` if the delete operation was successful, otherwise `false`.
  Future<bool> delete(String storageName, String storageKey);

  /// Retrieves all items stored under a specific [storageName] (i.e., a Hive box).
  ///
  /// Returns a list of all items stored in the specified storage box.
  Future<List<T>> getAll(String storageName);

  /// Saves a list of items to local storage using the `storageName` and `storageKey`
  /// from the first item in the list.
  ///
  /// Returns `true` if the save operation was successful, otherwise `false`.
  Future<bool> saveList(String storageName, String storageKey, List<T> data);

  /// Retrieves a list of items from local storage using the specified [storageName] and [storageKey].
  ///
  /// Returns an empty list if no data is found or an error occurs.
  Future<List<T>> getList(String storageName, String storageKey);
}
