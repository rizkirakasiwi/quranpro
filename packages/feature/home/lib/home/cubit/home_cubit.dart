import 'package:common/exception/app_exception.dart';
import 'package:common/exception/server_error.dart';
import 'package:dependency/bloc.dart';
import 'package:domain/usecase/get_surah_usecase.dart';
import 'package:home/home/cubit/home_state.dart';
import 'package:home/home/data/mapper.dart';
import 'package:localization/setting/accepted_language.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSurahUsecase _getSurahUseCase;

  HomeCubit(this._getSurahUseCase) : super(HomeInitial());

  void getSurah(AcceptedLanguage language) async {
    emit(HomeLoading());
    final listOfSurah = await _getSurahUseCase.call(language.name);
    listOfSurah.fold((left) => _handleFail(left), (right) {
      final result = right.map((e) => e.toData()).toList();
      emit(HomeSurahLoaded(result));
    });
  }

  void _handleFail(AppException exception) {
    print("Teeeeeeeeeeeeest ${exception.getMessage()}");
    if (exception is ServerError) {
      emit(HomeError(exception.getMessage()));
    } else {
      emit(HomeFail(exception.getMessage()));
    }
  }
}
