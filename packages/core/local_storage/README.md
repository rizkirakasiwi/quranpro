

# Local Storage Abstraction

This package provides an abstract interface for managing local data storage using the **Strategy Pattern**, allowing you to switch between different storage implementations (e.g., Hive, SharedPreferences, etc.) without changing business logic.

---

## 📦 Core Components

### `LocalStorageData`

Represents a data model that can be stored locally. Classes implementing this must define:
- `storageName`: The name/namespace of the storage container (e.g., Hive box name).
- `storageKey`: The key to uniquely identify the data within the storage.

```dart
abstract class LocalStorageData {
  String get storageName;
  String get storageKey;
}
```

---

### `LocalStorageStrategy`

Defines a contract for storage operations. Implement this to create a custom storage strategy (e.g., HiveStrategy, SharedPrefsStrategy).

```dart
abstract class LocalStorageStrategy {
  Future<bool> save<T>(String storageName, String key, T data);
  Future<T?> get<T>(String storageName, String key);
  Future<bool> delete(String storageName, String key);
  Future<List<T>> getAll<T>(String storageName);
  Future<bool> saveList<T>(String storageName, String key, List<T> data);
  Future<List<T>> getList<T>(String storageName, String key);
}
```

---

### `LocalStorage`

High-level interface to access local storage using a specified strategy. You can store and retrieve data via:
- Manual key and storage name.
- Object-based (`LocalStorageData`-based) convenience methods.

```dart
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
```

---

## 🔧 How to Use

### 1. Create a Storage Strategy

```dart
class HiveStorageStrategy implements LocalStorageStrategy {
  // Implement all required methods using Hive logic
}
```

### 2. Implement Your Data Model

```dart
class UserData implements LocalStorageData {
  final String id;
  final String name;

  @override
  String get storageName => 'users';

  @override
  String get storageKey => id;
}
```

### 3. Use `LocalStorage` with Your Strategy

```dart
final storage = MyLocalStorageImpl(); // Your concrete implementation
final strategy = HiveStorageStrategy();

final user = UserData(id: '123', name: 'Ali');
await storage.saveObject(user, strategy: strategy);
```

---

## 🧠 Benefits

- ✅ **Decoupled architecture**: Easily switch between different storage mechanisms.
- 🔁 **Reusable logic**: Object-based methods make CRUD operations more intuitive.
- 📦 **Extendable**: Add support for new storage types without touching core logic.

---

## 📄 License

MIT License © [Your Name]
```

Let me know if you want to include a real example with Hive or SharedPreferences, or if you'd like to generate the full implementation scaffolding for `HiveStorageStrategy` or a mock `LocalStorage`!