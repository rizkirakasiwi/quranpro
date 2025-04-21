import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:common/exception/client_error.dart';
import 'package:common/exception/server_error.dart';
import 'package:domain/model/surah_model.dart';
import 'package:domain/usecase/get_surah_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home/cubit/home_cubit.dart';
import 'package:home/home/cubit/home_state.dart';
import 'package:home/home/data/mapper.dart';
import 'package:localization/setting/accepted_language.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSurahUseCase extends Mock implements GetSurahUsecase {}

void main() {
  late GetSurahUsecase getSurahUsecase;
  late HomeCubit sut;

  setUp(() {
    getSurahUsecase = MockGetSurahUseCase();
    sut = HomeCubit(getSurahUsecase);
  });

  test('Initial state', () async {
    expect(sut.state, HomeInitial());
  });

  final List<SurahModel> surahList = [
    SurahModel(
      number: 0,
      arabicName: "name",
      latinName: 'englishName',
      translation: "englishNameTranslation",
      totalAyahs: 0,
      revelationType: "revelationType",
    ),
    SurahModel(
      number: 1,
      arabicName: "name",
      latinName: 'englishName',
      translation: "englishNameTranslation",
      totalAyahs: 0,
      revelationType: "revelationType",
    ),
  ];

  blocTest<HomeCubit, HomeState>(
    'should emit [HomeLoading, HomeSurahLoaded] when getSurah is called',
    build: () {
      when(
        () => getSurahUsecase.call("id"),
      ).thenAnswer((_) async => Right(surahList));
      return sut;
    },
    act: (cubit) => cubit.getSurah(AcceptedLanguage.id),
    wait: const Duration(milliseconds: 500),
    expect:
        () => [
          HomeLoading(),
          HomeSurahLoaded(surahList.map((e) => e.toData()).toList()),
        ],
  );

  blocTest(
    'should emit [HomeLoading, HomeFail] when get surah return ClientError',
    build: () {
      when(
        () => getSurahUsecase.call("id"),
      ).thenAnswer((_) async => Left(ClientError('Something went wrong ')));
      return sut;
    },
    act: (cubit) => cubit.getSurah(AcceptedLanguage.id),
    wait: const Duration(milliseconds: 500),
    expect: () => [HomeLoading(), HomeFail('Something went wrong')],
  );

  blocTest(
    'should emit [HomeLoading, HomeError] when get surah return ServerError',
    build: () {
      when(
        () => getSurahUsecase.call("id"),
      ).thenAnswer((_) async => Left(ServerError('Something went wrong')));
      return sut;
    },
    act: (cubit) => cubit.getSurah(AcceptedLanguage.id),
    wait: const Duration(milliseconds: 500),
    expect: () => [HomeLoading(), HomeError('Something went wrong')],
  );
}
