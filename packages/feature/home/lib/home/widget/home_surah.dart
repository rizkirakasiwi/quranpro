import 'package:design_system/widget/app_image.dart';
import 'package:design_system/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:home/home/data/home_surah_data.dart';
import 'package:localization/helper/get_string.dart';

class HomeSurah extends StatelessWidget {
  const HomeSurah({super.key, required this.surahData});

  final HomeSurahData surahData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outlineVariant.withAlpha(70),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Number Badge
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: AppText(
                '${surahData.number}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Name + metadata
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      surahData.latinName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: AppText(
                        '(${surahData.translation})',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontSize: 12
                        ),
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _tag(
                      context,
                      "icons/ic_place.svg",
                      surahData.revelationType,
                    ),
                    const SizedBox(width: 8),
                    AppText(
                      '•',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _tag(
                      context,
                      "icons/ic_ayah.svg",
                      context.getString()?.somethingAyah(
                            surahData.totalAyahs,
                          ) ??
                          "${surahData.totalAyahs} Ayah",
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Arabic name
          SizedBox(width: 100,child: AppText.arabic(surahData.arabicName, style: TextStyle(fontSize: 14), maxLines: 2, textOverflow: TextOverflow.ellipsis,)),
        ],
      ),
    );
  }

  Widget _tag(BuildContext context, String icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage.svg(
            icon,
            color: Theme.of(context).colorScheme.outline,
            width: 8,
            height: 8,
          ),
          const SizedBox(width: 4),
          AppText(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
