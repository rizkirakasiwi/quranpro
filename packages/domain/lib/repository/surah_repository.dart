import 'package:common/common.dart';
import 'package:common/exception/app_exception.dart';
import 'package:domain/model/surah_model.dart';

abstract class SurahRepository {
  Future<Either<AppException, List<SurahModel>>> getAllSurah();
}