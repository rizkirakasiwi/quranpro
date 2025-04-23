import 'package:dependency/auto_injector.dart';
import 'package:local_storage/helper/local_storage.dart';
import 'package:local_storage/helper/local_storage_impl.dart';

final localStorageModule = AutoInjector(
  tag: 'local_storage_module',
  on: (inject) {
    inject.addLazySingleton<LocalStorage>(LocalStorageImpl.new);
  },
);
