import 'package:dependency/auto_injector.dart';
import 'package:domain/usecase/get_surah_usecase.dart';

final usecaseModule = AutoInjector(
  tag: 'usecase_module',
  on: (inject) {
    inject.add(GetSurahUsecase.new);
  }
);