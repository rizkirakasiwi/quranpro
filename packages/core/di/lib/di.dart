import 'package:data/di/data_di.dart';
import 'package:domain/di/usecase_di.dart';
import 'package:home/home/di/home_di.dart';
import 'package:injector/injector.dart';
import 'package:local_storage/local_storage.dart';
import 'package:network/di/network_di.dart';

extension Di on Injector {
  void injectAll() {
    injectNetwork();
    injectLocalStorage();
    injectUseCase();
    injectData();
    injectHome();
  }
}
