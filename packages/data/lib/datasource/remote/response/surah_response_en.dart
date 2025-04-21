
class SurahResponseEn {
  num? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  num? numberOfAyahs;
  String? revelationType;

  SurahResponseEn({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

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

  SurahResponseEn.fromJson(dynamic json) {
    number = json["number"];
    name = json["name"];
    englishName = json["englishName"];
    englishNameTranslation = json["englishNameTranslation"];
    numberOfAyahs = json["numberOfAyahs"] as int;
    revelationType = json["revelationType"];
  }
}