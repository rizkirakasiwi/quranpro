// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Quran Pro';

  @override
  String get search => 'Pencarian';

  @override
  String get recentlyRead => 'Terakhir dibaca';

  @override
  String somethingAyah(int ayah) {
    return '$ayah ayat';
  }

  @override
  String get surah => 'Surah';

  @override
  String get juz => 'Juz';

  @override
  String get page => 'Halaman';

  @override
  String get makiyyah => 'Makiyyah';

  @override
  String get madaniyyah => 'Madaniyyah';
}
