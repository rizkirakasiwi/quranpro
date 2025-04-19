import 'package:local_storage/local_storage.dart';

part 'surah_entity.g.dart';

@HiveType(typeId: HiveConstant.surahEntity)
class SurahEntity extends HiveObject implements LocalStorageData {
  @HiveField(0)
  num? number;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? englishName;
  @HiveField(3)
  String? englishNameTranslation;
  @HiveField(4)
  num? numberOfAyahs;
  @HiveField(5)
  String? revelationType;

  SurahEntity({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  SurahEntity copyWith({
    num? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    num? numberOfAyahs,
    String? revelationType,
  }) => SurahEntity(
    number: number ?? this.number,
    name: name ?? this.name,
    englishName: englishName ?? this.englishName,
    englishNameTranslation:
        englishNameTranslation ?? this.englishNameTranslation,
    numberOfAyahs: numberOfAyahs ?? this.numberOfAyahs,
    revelationType: revelationType ?? this.revelationType,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["number"] = number;
    map["name"] = name;
    map["englishName"] = englishName;
    map["englishNameTranslation"] = englishNameTranslation;
    map["numberOfAyahs"] = numberOfAyahs;
    map["revelationType"] = revelationType;
    return map;
  }

  SurahEntity.fromJson(dynamic json) {
    number = json["number"];
    name = json["name"];
    englishName = json["englishName"];
    englishNameTranslation = json["englishNameTranslation"];
    numberOfAyahs = json["numberOfAyahs"] as int;
    revelationType = json["revelationType"];
  }

  @override
  String get storageKey => "surah_entity";

  @override
  String get storageName => "surah_entity";
}
