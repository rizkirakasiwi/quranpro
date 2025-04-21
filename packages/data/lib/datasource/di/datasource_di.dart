import 'package:data/datasource/local/local_surah_datasource.dart';
import 'package:data/datasource/local/local_surah_datasource_impl.dart';
import 'package:data/datasource/remote/helper/get_surah_list_helper.dart';
import 'package:data/datasource/remote/remote_surah_datasource.dart';
import 'package:data/datasource/remote/remote_surah_datasource_impl.dart';
import 'package:injector/injector.dart';

extension DatasourceDi on Injector {
  void injectDatasource() {
    // Remote Surah Datasource
    registerSingleton<RemoteSurahDatasource>(
      () => RemoteSurahDatasourceImpl(get(), get()),
    );

    // Local surah datasource
    registerSingleton<LocalSurahDatasource>(
      () => LocalSurahDatasourceImpl(get()),
    );

    // get surah helper
    registerSingleton<GetSurahListHelper>(() => GetSurahListHelperImpl(get()));
  }
}
