import 'package:dependency/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home/home/cubit/home_cubit.dart';
import 'package:home/home/cubit/home_state.dart';
import 'package:home/home/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = context.read<HomeCubit>();
    homeCubit.getSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return HomeWidget(homeState: state);
    });
  }
}
