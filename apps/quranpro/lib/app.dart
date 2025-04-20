import 'package:design_system/theme.dart';
import 'package:design_system/themes/util.dart';
import 'package:flutter/material.dart';
import 'package:home/home/home_page.dart';
import 'package:localization/localization.dart';

class MyApp extends StatelessWidget {
  final String currentLanguage;

  const MyApp({super.key, required this.currentLanguage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Poppins");
    AppTheme theme = AppTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      locale: Locale(currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme.light(),
      darkTheme: theme.dark(),
      home: const HomePage(),
    );
  }
}
