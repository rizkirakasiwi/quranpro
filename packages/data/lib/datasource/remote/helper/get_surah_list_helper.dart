import 'package:config/flavor_env.dart';
import 'package:data/datasource/remote/response/surah_response_en.dart';
import 'package:data/datasource/remote/response/surah_response_id.dart';
import 'package:data/entity/mapper/surah_response_en_to_entity.dart';
import 'package:data/entity/mapper/surah_response_id_to_entity.dart';
import 'package:data/entity/surah_entity.dart';
import 'package:network/network.dart';

abstract class GetSurahListHelper {
  Future<NetworkResponse<List<SurahEntity>>> getSurahListEn();

  Future<NetworkResponse<List<SurahEntity>>> getSurahListId();
}

class GetSurahListHelperImpl implements GetSurahListHelper {
  final NetworkClient client;

  static final String _surah = "/surah";
  static final String _surat = "/surat";

  const GetSurahListHelperImpl(this.client);

  @override
  Future<NetworkResponse<List<SurahEntity>>> getSurahListEn() async {
    final NetworkResponse<List<SurahResponseEn>> response = await client.get(
      _surah,
      fromJsonT:
          (json) =>
              (json as List).map((e) => SurahResponseEn.fromJson(e)).toList(),
    );

    final List<SurahEntity> surahList =
        response.data!.map((e) => e.toEntity()).toList();
    return NetworkResponse<List<SurahEntity>>(
      code: response.code,
      status: response.status,
      data: surahList,
    );
  }

  @override
  Future<NetworkResponse<List<SurahEntity>>> getSurahListId() async {
    final List<SurahResponseId> response = await client.getAlt(
      _surat,
      baseUrl: FlavorEnv.baseUrlAlt,
      fromJsonT:
          (json) =>
              (json as List).map((e) => SurahResponseId.fromJson(e)).toList(),
    );
    final List<SurahEntity> surahList =
        response.map((e) => e.toEntity()).toList();
    return NetworkResponse<List<SurahEntity>>(
      code: 200,
      status: 'OK',
      data: surahList,
    );
  }
}
