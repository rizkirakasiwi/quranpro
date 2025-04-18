import 'package:dependency/equatable.dart';

class SurahModel extends Equatable {
  final num? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final num? numberOfAyahs;
  final String? revelationType;

  const SurahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
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
    name: name ?? this.name,
    englishName: englishName ?? this.englishName,
    englishNameTranslation:
        englishNameTranslation ?? this.englishNameTranslation,
    numberOfAyahs: numberOfAyahs ?? this.numberOfAyahs,
    revelationType: revelationType ?? this.revelationType,
  );

  @override
  List<Object?> get props => [
    number,
    name,
    englishName,
    englishNameTranslation,
    numberOfAyahs,
    revelationType,
  ];
}
