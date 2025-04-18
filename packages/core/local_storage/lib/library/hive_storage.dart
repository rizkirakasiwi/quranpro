import 'package:local_storage/core/local_storage_strategy.dart';
import 'package:local_storage/core/local_storage_data.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class HiveStorage<T extends LocalStorageData> implements LocalStorageStrategy {
  const HiveStorage();

  Future<Box> _openBox(String name) async {
    return await Hive.openBox(name);
  }

  @override
  Future<bool> save(LocalStorageData data) async {
    try {
      final box = await _openBox(data.storageName);
      await box.put(data.storageKey, data);
      return true;
    } catch (e, stackTrace) {
      debugPrint('HiveSmartStorage.save error: $e\n$stackTrace');
      return false;
    }
  }

  @override
  Future<T?> get(String storageName, String storageKey) async {
    try {
      final box = await _openBox(storageName);
      return box.get(storageKey) as T?;
    } catch (e, stackTrace) {
      debugPrint('HiveSmartStorage.get error: $e\n$stackTrace');
      return null;
    }
  }

  @override
  Future<bool> delete(String storageName, String storageKey) async {
    try {
      final box = await _openBox(storageName);
      await box.delete(storageKey);
      return true;
    } catch (e, stackTrace) {
      debugPrint('HiveSmartStorage.delete error: $e\n$stackTrace');
      return false;
    }
  }

  @override
  Future<List<T>> getAll(String storageName) async {
    try {
      final box = await _openBox(storageName);
      return box.values.cast<T>().toList();
    } catch (e, stackTrace) {
      debugPrint('HiveSmartStorage.getAll error: $e\n$stackTrace');
      return [];
    }
  }

  @override
  Future<List<LocalStorageData>> getList(
    String storageName,
    String storageKey,
  ) async {
    try {
      final box = await _openBox(storageName);
      final result = box.get(storageKey);

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
  Future<bool> saveList(
    String storageName,
    String storageKey,
    List<LocalStorageData> data,
  ) async {
    try {
      final box = await _openBox(storageName);
      await box.put(storageKey, data);
      return true;
    } catch (e, s) {
      debugPrint('HiveSmartStorage.saveList error: $e\n$s');
      return false;
    }
  }
}
