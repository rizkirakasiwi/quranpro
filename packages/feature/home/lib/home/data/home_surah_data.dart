import 'package:dependency/equatable.dart';

class HomeSurahData extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;

  const HomeSurahData({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
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

const listOfSurah = [
  HomeSurahData(
    number: 1,
    englishName: "Al-Fatiha",
    englishNameTranslation: "The Opening",
    name: "الفاتحة",
    revelationType: "Makki",
    numberOfAyahs: 7,
  ),
  HomeSurahData(
    number: 2,
    englishName: "Al-Baqarah",
    englishNameTranslation: "The Cow",
    name: "البقرة",
    revelationType: "Madani",
    numberOfAyahs: 286,
  ),
];