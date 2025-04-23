import 'package:data/datasource/local/local_surah_datasource.dart';
import 'package:data/datasource/local/local_surah_datasource_impl.dart';
import 'package:data/datasource/remote/helper/get_surah_list_helper.dart';
import 'package:data/datasource/remote/remote_surah_datasource.dart';
import 'package:data/datasource/remote/remote_surah_datasource_impl.dart';
import 'package:dependency/auto_injector.dart';

final datasourceModule = AutoInjector(
  tag: 'datasource_module',
  on: (inject) {
    inject.addSingleton<RemoteSurahDatasource>(RemoteSurahDatasourceImpl.new);
    inject.addSingleton<LocalSurahDatasource>(LocalSurahDatasourceImpl.new);
    inject.addSingleton<GetSurahListHelper>(GetSurahListHelperImpl.new);
  }
);
