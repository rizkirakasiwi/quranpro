import 'package:data/repository/surah_repository_impl.dart';
import 'package:domain/repository/surah_repository.dart';
import 'package:injector/injector.dart';

extension RepositoryDi on Injector {
  void injectRepository() {
    registerSingleton<SurahRepository>(() => SurahRepositoryImpl(remote: get(), local: get()));
  }
}
