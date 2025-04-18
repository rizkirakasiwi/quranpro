import 'package:common_ui/widget/search_textfield.dart';
import 'package:dependency/bloc.dart';
import 'package:design_system/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:home/home/cubit/home_cubit.dart';
import 'package:home/home/cubit/home_state.dart';
import 'package:home/home/data/home_read_history_data.dart';
import 'package:home/home/data/home_surah_data.dart';
import 'package:home/home/widget/home_header.dart';
import 'package:home/home/widget/home_list_of_surah.dart';
import 'package:home/home/widget/home_read_history.dart';
import 'package:home/home/widget/home_content.dart';
import 'package:localization/helper/get_string.dart';

class HomeWidget extends StatelessWidget {
  final HomeState homeState;

  const HomeWidget({super.key, required this.homeState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: HomeHeader(
                  child: SafeArea(
                    child: Column(
                      children: [
                        _logoText(context),
                        const SizedBox(height: 16),
                        _searchBar(context),
                        const SizedBox(height: 16),
                        HomeReadHistory(
                          homeReadHistoryData: homeReadHistoryData,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
        body: HomeContent(
          surah: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state) {
                case OnLoading():
                  return const Center(child: CircularProgressIndicator());
                case OnSurahLoaded():
                  return HomeListOfSurah(surahList: state.listOfSurah);
                default:
                  return const Center(child: Text("Error"));
              }
            },
          ),
          juz: const AppText("Juz Page"),
          page: const AppText("Page Page"),
        ),
      ),
    );
  }

  Widget _logoText(BuildContext context) {
    return AppText(
      context.getString()?.appName ?? "Quran Pro",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchTextfield(hintText: context.getString()?.search ?? "Search"),
    );
  }
}
