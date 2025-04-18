import 'package:common/common.dart';
import 'package:common/either/either.dart';
import 'package:common/exception/app_exception.dart';
import 'package:data/datasource/local/local_surah_datasource.dart';
import 'package:data/datasource/remote/remote_surah_datasource.dart';
import 'package:data/entity/mapper/surah_entity_to_model.dart';
import 'package:data/repository/helper/fetch_data_helper.dart';
import 'package:domain/model/surah_model.dart';
import 'package:domain/repository/surah_repository.dart';

class SurahRepositoryImpl implements SurahRepository {
  final RemoteSurahDatasource remote;
  final LocalSurahDatasource local;

  const SurahRepositoryImpl({required this.remote, required this.local});

  @override
  Future<Either<AppException, List<SurahModel>>> getAllSurah() async {
    return fetchWithLocalFallback(
      localFetch: local.getSurahList,
      remoteFetch: remote.getSurahList,
      saveToLocal: local.saveSurahList,
      mapper: (e) => e.toModel(),
    );
  }
}
