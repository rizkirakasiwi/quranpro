import 'package:data/repository/surah_repository_impl.dart';
import 'package:dependency/auto_injector.dart';
import 'package:domain/repository/surah_repository.dart';


final repositoryModule = AutoInjector(
  tag: 'repository_module',
  on: (inject) {
    inject.addSingleton<SurahRepository>(SurahRepositoryImpl.new);
  }
);
