import 'package:data/di/data_di.dart';
import 'package:dependency/auto_injector.dart';
import 'package:domain/di/usecase_di.dart';
import 'package:home/home/di/home_di.dart';
import 'package:local_storage/local_storage.dart';
import 'package:localization/di/localization_di.dart';
import 'package:network/di/network_di.dart';

final appModule = AutoInjector(
  tag: "app_module",
  on: (inject) {
    inject.addInjector(networkModule);
    inject.addInjector(localizationModule);
    inject.addInjector(homeModule);
    inject.addInjector(usecaseModule);
    inject.addInjector(localStorageModule);
    inject.addInjector(dataModule);
    inject.commit();
  },
);
