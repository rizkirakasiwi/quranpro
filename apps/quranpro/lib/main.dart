import 'package:config/flavor.dart';
import 'package:design_system/theme.dart';
import 'package:design_system/themes/util.dart';
import 'package:di/di.dart';
import 'package:core_provider/bloc_provider.dart';
import 'package:core_provider/hive_adapter.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_page.dart';
import 'package:injector/injector.dart';
import 'package:local_storage/local_storage.dart';
import 'package:localization/localization.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  registerAllHiveAdapter();

  final injector = Injector.appInstance;
  injector.injectAll();
  FlavorConfig.flavor = Flavor.dev;

  runApp(blocProvider(const MyApp(), injector));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins");
    AppTheme theme = AppTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: const HomePage(),
    );
  }
}
