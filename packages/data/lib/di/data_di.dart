import 'package:data/datasource/di/datasource_di.dart';
import 'package:data/repository/di/repository_di.dart';
import 'package:injector/injector.dart';

extension DataDi on Injector {
  void injectData() {
    injectDatasource();
    injectRepository();
  }
}
