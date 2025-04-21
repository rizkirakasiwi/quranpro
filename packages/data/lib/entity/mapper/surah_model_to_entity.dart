import 'package:data/entity/surah_entity.dart';
import 'package:domain/model/surah_model.dart';

extension SurahModelToEntity on SurahModel {
  SurahEntity toModel() {
    return SurahEntity(
      number: number,
      name: arabicName,
      englishName: latinName,
      englishNameTranslation: translation,
      numberOfAyahs: totalAyahs,
      revelationType: revelationType,
    );
  }
}
