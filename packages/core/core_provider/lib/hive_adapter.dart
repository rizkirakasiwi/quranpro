import 'package:data/entity/surah_entity.dart';
import 'package:local_storage/local_storage.dart';

void registerAllHiveAdapter(){
  Hive.registerAdapter(SurahEntityAdapter());
}