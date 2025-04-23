import 'package:dependency/auto_injector.dart';
import 'package:localization/setting/localization_setting.dart';
import 'package:localization/setting/localization_setting_impl.dart';

final localizationModule = AutoInjector(
  tag: "localization_module",
  on: (inject){
    inject.addLazySingleton<LocalizationSetting>(LocalizationSettingImpl.new);
  }
);