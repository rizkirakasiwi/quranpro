import 'package:config/config/cubit/main_config_cubit.dart';
import 'package:dependency/bloc.dart';
import 'package:domain/usecase/get_surah_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/home/cubit/home_cubit.dart';
import 'package:injector/injector.dart';
import 'package:localization/setting/localization_setting.dart';

Widget blocProvider(Widget child, Injector injector) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeCubit(injector.get<GetSurahUsecase>()),
      ),
      BlocProvider(
        create:
            (context) => MainConfigCubit(
              localizationSetting: injector.get<LocalizationSetting>(),
            ),
      ),
    ],
    child: child,
  );
}
