// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Quran Pro';

  @override
  String get search => 'Search';

  @override
  String get recentlyRead => 'Recently Read';

  @override
  String somethingAyah(int ayah) {
    return '$ayah ayah';
  }

  @override
  String get surah => 'Surah';

  @override
  String get juz => 'Juz';

  @override
  String get page => 'Page';

  @override
  String get makiyyah => 'Makiyyah';

  @override
  String get madaniyyah => 'Madaniyyah';
}
