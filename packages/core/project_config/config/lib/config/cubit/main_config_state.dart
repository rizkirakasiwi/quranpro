import 'package:dependency/equatable.dart';
import 'package:localization/setting/accepted_language.dart';

abstract class MainConfigState extends Equatable{

  @override
  List<Object?> get props => [];
}

class CurrentLanguage extends MainConfigState{
  final AcceptedLanguage language;

  CurrentLanguage(this.language);

  @override
  List<Object?> get props => [language];
}

class MainDefaultConfig extends MainConfigState{
  final AcceptedLanguage defaultLanguage;

  MainDefaultConfig({this.defaultLanguage = AcceptedLanguage.id});

  @override
  List<Object?> get props => [defaultLanguage];
}