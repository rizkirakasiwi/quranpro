

/// An abstract class that defines the contract for objects 
/// that can be stored in local storage systems like Hive.
///
/// Implementing classes must provide a unique `storageName` and `storageKey`
/// to identify the storage box and the key within that box.
abstract class LocalStorageData  {
  /// The name of the storage box.
  ///
  /// This is typically used to determine which box the data will be stored in.
  /// For example, it can represent a logical group or category of data.
  String get storageName;

  /// The unique key used to identify the object within the storage box.
  ///
  /// This key should be unique within the context of the `storageName` to
  /// ensure no collisions occur when storing or retrieving data.
  String get storageKey;
}

