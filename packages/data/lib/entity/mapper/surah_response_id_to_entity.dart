import 'package:data/datasource/remote/response/surah_response_id.dart';
import 'package:data/entity/surah_entity.dart';

extension SurahResponseIdToEntity on SurahResponseId {
  SurahEntity toEntity() {
    return SurahEntity(
      number: nomor,
      name: nama,
      englishName: namaLatin,
      englishNameTranslation: arti,
      numberOfAyahs: jumlahAyat,
      revelationType: tempatTurun
    );
  }
}