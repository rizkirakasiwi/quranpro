import 'package:data/datasource/local/local_surah_datasource.dart';
import 'package:data/datasource/local/local_surah_datasource_impl.dart';
import 'package:data/datasource/remote/remote_surah_datasource.dart';
import 'package:data/datasource/remote/remote_surah_datasource_impl.dart';
import 'package:injector/injector.dart';

extension DatasourceDi on Injector {
  void injectDatasource() {
    // Remote Surah Datasource
    registerSingleton<RemoteSurahDatasource>(
      () => RemoteSurahDatasourceImpl(get()),
    );

    // Local surah datasource
    registerSingleton<LocalSurahDatasource>(
      () => LocalSurahDatasourceImpl(get()),
    );
  }
}
