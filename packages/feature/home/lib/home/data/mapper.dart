import 'package:domain/model/surah_model.dart';
import 'package:home/home/data/home_surah_data.dart';

extension SurahModelToHomeData on SurahModel {
  HomeSurahData toData() {
    return HomeSurahData(
      number: number?.toInt() ?? 0,
      name: name ?? "",
      englishName: englishName ?? "",
      englishNameTranslation: englishNameTranslation ?? "",
      numberOfAyahs: numberOfAyahs?.toInt() ?? 0,
      revelationType: revelationType ?? "",
    );
  }
}
