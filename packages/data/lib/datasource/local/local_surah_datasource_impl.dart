import 'package:data/datasource/local/local_surah_datasource.dart';
import 'package:data/entity/surah_entity.dart';
import 'package:local_storage/local_storage.dart';

class LocalSurahDatasourceImpl implements LocalSurahDatasource {
  final LocalStorage storage;

  const LocalSurahDatasourceImpl(this.storage);

  @override
  Future<List<SurahEntity>> getSurahList() async {
    return await storage.getList(SurahEntity());
  }
  
  @override
  Future<bool> saveSurahList(List<SurahEntity> surah) async {
    return await storage.saveList(surah);
  }
}
