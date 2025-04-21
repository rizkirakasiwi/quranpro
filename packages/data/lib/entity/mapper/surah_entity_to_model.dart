import 'package:data/entity/surah_entity.dart';
import 'package:domain/model/surah_model.dart';

extension SurahEntityToModel on SurahEntity {
  SurahModel toModel() {
    return SurahModel(
      number: number,
      arabicName: name,
      latinName: englishName,
      translation: englishNameTranslation,
      totalAyahs: numberOfAyahs,
      revelationType: revelationType,
    );
  }
}
