import 'package:data/datasource/di/datasource_di.dart';
import 'package:data/repository/di/repository_di.dart';
import 'package:dependency/auto_injector.dart';


final dataModule = AutoInjector(
  tag: 'data_module',
  on: (inject) {
    inject.addInjector(datasourceModule);
    inject.addInjector(repositoryModule);
  }
);
