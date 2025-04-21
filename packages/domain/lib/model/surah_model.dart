import 'package:dependency/equatable.dart';

class SurahModel extends Equatable {
  final num? number;
  final String? arabicName;
  final String? latinName;
  final String? translation;
  final num? totalAyahs;
  final String? revelationType;

  const SurahModel({
    this.number,
    this.arabicName,
    this.latinName,
    this.translation,
    this.totalAyahs,
    this.revelationType,
  });

  SurahModel copyWith({
    num? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    num? numberOfAyahs,
    String? revelationType,
  }) => SurahModel(
    number: number ?? this.number,
    arabicName: name ?? arabicName,
    latinName: englishName ?? latinName,
    translation:
        englishNameTranslation ?? translation,
    totalAyahs: numberOfAyahs ?? totalAyahs,
    revelationType: revelationType ?? this.revelationType,
  );

  @override
  List<Object?> get props => [
    number,
    arabicName,
    latinName,
    translation,
    totalAyahs,
    revelationType,
  ];
}
