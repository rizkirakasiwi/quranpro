import 'package:local_storage/helper/local_storage.dart';
import 'package:localization/setting/accepted_language.dart';
import 'package:localization/setting/localization_setting.dart';

class LocalizationSettingImpl implements LocalizationSetting {
  final LocalStorage localStorage;

  static const String _storageName = "localizationSetting";
  static const String _storageKey = "currentLanguage";

  const LocalizationSettingImpl(this.localStorage);

  @override
  Future<AcceptedLanguage> getLanguage() async {
    final currentLanguage = await localStorage.get(_storageName, _storageKey);
    return AcceptedLanguage.values.firstWhere(
      (e) => e.name == currentLanguage,
      orElse: () => AcceptedLanguage.id,
    );
  }

  @override
  Future<void> setLanguage(AcceptedLanguage code) {
    return localStorage.save(_storageName, _storageKey, code.name);
  }
}
