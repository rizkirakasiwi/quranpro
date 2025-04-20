import 'package:config/flavor.dart';
import 'package:core_provider/bloc_provider.dart';
import 'package:core_provider/hive_adapter.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:local_storage/local_storage.dart';
import 'package:localization/setting/localization_setting.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quranpro/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init hive and register hive adapter
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  registerAllHiveAdapter();

  // Init injector
  final injector = Injector.appInstance;
  injector.injectAll();

  // Setup current language
  final currentLanguage =
      await injector.get<LocalizationSetting>().getLanguage();

  // Setup current environment
  FlavorConfig.flavor = Flavor.dev;

  runApp(blocProvider(MyApp(currentLanguage: currentLanguage.name), injector));
}
