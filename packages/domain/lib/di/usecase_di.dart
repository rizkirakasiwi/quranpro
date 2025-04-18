import 'package:domain/usecase/get_surah_usecase.dart';
import 'package:injector/injector.dart';

extension UsecaseDi on Injector {
  void injectUseCase(){
    registerSingleton(() => GetSurahUsecase(repository: get()));
  }
}