import 'package:data/entity/surah_entity.dart';
import 'package:network/network.dart';

abstract class RemoteSurahDatasource {
  Future<NetworkResponse<List<SurahEntity>>> getSurahList(String locale);
}
