import 'package:domain/model/surah_model.dart';
import 'package:home/home/data/home_surah_data.dart';

extension SurahModelToHomeData on SurahModel {
  HomeSurahData toData() {
    return HomeSurahData(
      number: number?.toInt() ?? 0,
      arabicName: arabicName ?? "",
      latinName: latinName ?? "",
      translation: translation ?? "",
      totalAyahs: totalAyahs?.toInt() ?? 0,
      revelationType: revelationType ?? "",
    );
  }
}
