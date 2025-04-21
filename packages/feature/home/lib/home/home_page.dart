import 'package:config/config/cubit/main_config_cubit.dart';
import 'package:config/config/cubit/main_config_state.dart';
import 'package:dependency/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home/home/cubit/home_cubit.dart';
import 'package:home/home/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit homeCubit;
  late final MainConfigCubit config;

  @override
  void initState() {
    homeCubit = context.read<HomeCubit>();
    config = context.read<MainConfigCubit>();
    config.initLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => homeCubit),
        BlocProvider(create: (context) => config),
      ],
      child: BlocBuilder<MainConfigCubit, MainConfigState>(
        builder: (context, state) {
          if (state is CurrentLanguage) {
            homeCubit.getSurah(state.language);
          }
          return HomeWidget();
        },
      ),
    );
  }
}
