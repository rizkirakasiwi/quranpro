import 'package:dependency/equatable.dart';
import 'package:home/home/data/home_surah_data.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSurahLoaded extends HomeState {
  final List<HomeSurahData> listOfSurah;

  OnSurahLoaded(this.listOfSurah);

  @override
  List<Object?> get props => [listOfSurah];
}

class OnLoading extends HomeState {}

class OnInitial extends HomeState {}

class OnFail extends HomeState {
  final String? message;

  OnFail(this.message);

  @override
  List<Object?> get props => [message];
}

class OnError extends HomeState {
  final String? message;
  OnError(this.message);

  @override
  List<Object?> get props => [message];
}
