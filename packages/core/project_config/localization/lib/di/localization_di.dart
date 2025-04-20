import 'package:injector/injector.dart';
import 'package:localization/setting/localization_setting.dart';
import 'package:localization/setting/localization_setting_impl.dart';

extension LocalizationDi on Injector {
  void injectLocalization() {
    registerSingleton<LocalizationSetting>(() => LocalizationSettingImpl(get()));
  }
}