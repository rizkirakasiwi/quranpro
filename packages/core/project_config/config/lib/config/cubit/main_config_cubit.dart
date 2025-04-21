import 'package:config/config/cubit/main_config_state.dart';
import 'package:dependency/bloc.dart';
import 'package:localization/setting/accepted_language.dart';
import 'package:localization/setting/localization_setting.dart';

class MainConfigCubit extends Cubit<MainConfigState>{
  LocalizationSetting localizationSetting;
  MainConfigCubit({required this.localizationSetting}): super(MainDefaultConfig());

  void initLanguage() async{
    final currentLanguage = await localizationSetting.getLanguage();
    emit(CurrentLanguage(currentLanguage));
  }

  void setLanguage(AcceptedLanguage language) async{
    await localizationSetting.setLanguage(language);
    emit(CurrentLanguage(language));
  }
}