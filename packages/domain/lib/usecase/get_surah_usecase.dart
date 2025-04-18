import 'package:common/common.dart';
import 'package:common/exception/app_exception.dart';
import 'package:domain/model/surah_model.dart';
import 'package:domain/repository/surah_repository.dart';

class GetSurahUsecase {
  final SurahRepository repository;

  const GetSurahUsecase({required this.repository});

  Future<Either<AppException, List<SurahModel>>> call() {
    return repository.getAllSurah();
  }
}
