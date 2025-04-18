import 'package:data/entity/surah_entity.dart';

abstract class LocalSurahDatasource {
  Future<List<SurahEntity>> getSurahList();
  Future<bool> saveSurahList(List<SurahEntity> surah);
}
