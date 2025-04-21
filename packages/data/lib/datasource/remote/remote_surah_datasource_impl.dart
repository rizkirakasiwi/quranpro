import 'package:data/datasource/remote/helper/get_surah_list_helper.dart';
import 'package:data/datasource/remote/remote_surah_datasource.dart';
import 'package:data/entity/surah_entity.dart';
import 'package:network/network.dart';

class RemoteSurahDatasourceImpl implements RemoteSurahDatasource {
  final NetworkClient client;
  final GetSurahListHelper getSurahListHelper;

  const RemoteSurahDatasourceImpl(this.client, this.getSurahListHelper);

  @override
  Future<NetworkResponse<List<SurahEntity>>> getSurahList(String locale) {
    switch (locale) {
      case 'en':
        return getSurahListHelper.getSurahListEn();
      case 'id':
        return getSurahListHelper.getSurahListId();
      default:
        return getSurahListHelper.getSurahListId();
    }
  }
}
