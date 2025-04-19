import 'package:dependency/equatable.dart';
import 'package:home/home/data/home_surah_data.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeSurahLoaded extends HomeState {
  final List<HomeSurahData> listOfSurah;

  HomeSurahLoaded(this.listOfSurah);

  @override
  List<Object?> get props => [listOfSurah];
}

class HomeLoading extends HomeState {}

class HomeInitial extends HomeState {}

class HomeFail extends HomeState {
  final String? message;

  HomeFail(this.message);

  @override
  List<Object?> get props => [message];
}

class HomeError extends HomeState {
  final String? message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
