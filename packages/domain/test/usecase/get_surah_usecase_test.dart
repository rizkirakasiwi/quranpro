
import 'package:common/common.dart';
import 'package:common/exception/client_error.dart';
import 'package:domain/model/surah_model.dart';
import 'package:domain/repository/surah_repository.dart';
import 'package:domain/usecase/get_surah_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSurahRepository extends Mock implements SurahRepository {}

void main(){
  late MockSurahRepository mockSurahRepository;
  late GetSurahUsecase sut;

  setUp(() {
    mockSurahRepository = MockSurahRepository();
    sut = GetSurahUsecase(repository: mockSurahRepository);
  });

  test('should return Right(List<SurahModel>) when repository call is successful', () async{
    // Arrange
    final model = [SurahModel()];
    when(() => mockSurahRepository.getAllSurah(any())).thenAnswer((_) async => Right(model));

    // Act
    final result = await sut.call("id");

    // Assert
    expect(result.getRightOrNull(), model);
  });

  test('should return Left(AppException) when repository call fails', () async {
    // Arrange
    final exception = ClientError('test');
    when(() => mockSurahRepository.getAllSurah(any())).thenAnswer((_) async => Left(exception));

    // Act
    final result = await sut.call("id");

    // Assert
    expect(result.getLeftOrNull(), exception);
  });
}