import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:local_storage/core/local_storage_strategy.dart';

class HiveStorage implements LocalStorageStrategy {
  const HiveStorage();

  Future<Box> _openBox(String storageName) async {
    return await Hive.openBox(storageName);
  }
  
  @override
  Future<bool> delete(String storageName, String key) async {
    try {
      final box = await _openBox(storageName);
      await box.delete(key);
      return true;
    } catch (e, stackTrace) {
      debugPrint('HiveStorage.delete error: $e\n$stackTrace');
      return false;
    }
  }

  @override
  Future<T?> get<T>(String storageName, String key) async {
    try {
      final box = await _openBox(storageName);
      return box.get(key) as T?;
    } catch (e, stackTrace) {
      debugPrint('HiveStorage.get error: $e\n$stackTrace');
      return null;
    }
  }

  @override
  Future<List<T>> getAll<T>(String storageName) async {
    try {
      final box = await _openBox(storageName);
      return box.values.cast<T>().toList();
    } catch (e, stackTrace) {
      debugPrint('HiveSmartStorage.getAll error: $e\n$stackTrace');
      return [];
    }
  }

  @override
  Future<bool> save<T>(String storageName, String key, T data) async {
    try {
      final box = await _openBox(storageName);
      await box.put(key, data);
      return true;
    } catch (e, stackTrace) {
      debugPrint('HiveStorage.save error: $e\n$stackTrace');
      return false;
    }
  }

  @override
  Future<List<T>> getList<T>(String storageName, String key) async {
    try {
      final box = await _openBox(storageName);
      final result = box.get(key);

      if (result == null) {
        return [];
      }

      if (result is! List) {
        throw Exception('Expected a List but got ${result.runtimeType}');
      }

      return result.cast<T>();
    } catch (e, s) {
      debugPrint('HiveStorage.getList error: $e\n$s');
      return [];
    }
  }

  @override
  Future<bool> saveList<T>(String storageName, String key, List<T> data) async {
    try {
      final box = await _openBox(storageName);
      await box.put(key, data);
      return true;
    } catch (e, s) {
      debugPrint('HiveStorage.saveList error: $e\n$s');
      return false;
    }
  }
  
}