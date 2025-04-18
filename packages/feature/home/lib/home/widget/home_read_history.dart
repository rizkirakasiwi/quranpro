import 'package:design_system/widget/app_button.dart';
import 'package:design_system/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:home/home/data/home_read_history_data.dart';
import 'package:localization/helper/get_string.dart';

class HomeReadHistory extends StatelessWidget {
  final List<HomeReadHistoryData> homeReadHistoryData;
  const HomeReadHistory({super.key, required this.homeReadHistoryData});

  @override
  Widget build(BuildContext context) {
    return homeReadHistoryData.isNotEmpty ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AppText(
            "${context.getString()?.recentlyRead ?? "Recently Read"}:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return AppButton.outlined(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                child: AppText(
                  "${homeReadHistoryData[index].surah} ${homeReadHistoryData[index].ayah}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: homeReadHistoryData.length,
          ),
        ),
      ],
    ) : const SizedBox.shrink();
  }
}