import 'package:common/exception/app_exception.dart';
import 'package:common/exception/server_error.dart';
import 'package:dependency/bloc.dart';
import 'package:domain/usecase/get_surah_usecase.dart';
import 'package:home/home/cubit/home_state.dart';
import 'package:home/home/data/mapper.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSurahUsecase _getSurahUseCase;

  HomeCubit(this._getSurahUseCase) : super(HomeInitial());

  void getSurah() async {
    emit(HomeLoading());
    final listOfSurah = await _getSurahUseCase.call();
    listOfSurah.fold((left) => _handleFail(left), (right) {
      final result = right.map((e) => e.toData()).toList();
      emit(HomeSurahLoaded(result));
    });
  }

  void _handleFail(AppException exception) {
    if (exception is ServerError) {
      emit(HomeError(exception.getMessage()));
    } else {
      emit(HomeFail(exception.getMessage()));
    }
  }
}
