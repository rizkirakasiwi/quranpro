import 'package:dependency/equatable.dart';

class HomeSurahData extends Equatable {
  final int number;
  final String arabicName;
  final String latinName;
  final String translation;
  final int totalAyahs;
  final String revelationType;

  const HomeSurahData({
    required this.number,
    required this.arabicName,
    required this.latinName,
    required this.translation,
    required this.totalAyahs,
    required this.revelationType,
  });

  HomeSurahData copyWith({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    int? numberOfAyahs,
    String? revelationType,
  }) => HomeSurahData(
    number: number ?? this.number,
    arabicName: name ?? this.arabicName,
    latinName: englishName ?? this.latinName,
    translation:
    englishNameTranslation ?? this.translation,
    totalAyahs: numberOfAyahs ?? this.totalAyahs,
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