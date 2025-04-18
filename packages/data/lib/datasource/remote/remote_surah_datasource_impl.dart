import 'package:data/datasource/remote/remote_surah_datasource.dart';
import 'package:data/entity/surah_entity.dart';
import 'package:network/network.dart';

class RemoteSurahDatasourceImpl implements RemoteSurahDatasource {
  final NetworkClient client;

  static const String _path = "/surah";

  const RemoteSurahDatasourceImpl(this.client);

  @override
  Future<NetworkResponse<List<SurahEntity>>> getSurahList() {
    return client.get(
      _path,
      fromJsonT:
          (json) =>
              (json as List).map((e) => SurahEntity.fromJson(e)).toList(),
    );
  }
}
