import 'package:localization/setting/accepted_language.dart';

abstract class LocalizationSetting {
  Future<void> setLanguage(AcceptedLanguage code);

  Future<AcceptedLanguage> getLanguage();
}
