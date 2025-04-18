import 'package:injector/injector.dart';
import 'package:local_storage/helper/local_storage_impl.dart';
import 'package:local_storage/helper/local_storage.dart';

extension LocalStorageDi on Injector {
  void injectLocalStorage() {
    registerSingleton<LocalStorage>(() => LocalStorageImpl());
  }
}
