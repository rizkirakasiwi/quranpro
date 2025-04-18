import 'package:flutter/material.dart';
import 'package:home/home/data/home_surah_data.dart';
import 'package:home/home/widget/home_surah.dart';

class HomeListOfSurah extends StatelessWidget {
  final List<HomeSurahData> surahList;
  const HomeListOfSurah({super.key, required this.surahList});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemCount: surahList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return HomeSurah(surahData: surahList[index]);
        },
      ),
    );
  }
}
