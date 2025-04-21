import 'package:data/datasource/remote/response/surah_response_en.dart';
import 'package:data/entity/surah_entity.dart';

extension SurahResponseEnToEntity on SurahResponseEn {
  SurahEntity toEntity() {
    return SurahEntity(
      number: number,
      name: name,
      englishName: englishName,
      englishNameTranslation: englishNameTranslation,
      numberOfAyahs: numberOfAyahs,
      revelationType: revelationType,
    );
  }
}