import 'package:dependency/google_fonts.dart';
import 'package:flutter/material.dart';

enum AppTextType { arabic, english }

class AppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final AppTextType type;

  const AppText.arabic(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.textDirection = TextDirection.rtl,
    this.type = AppTextType.arabic,
  });

  const AppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.textDirection,
    this.type = AppTextType.english,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style:
          type == AppTextType.arabic
              ? GoogleFonts.notoNaskhArabic(
                textStyle: style,
                fontSize: style?.fontSize ?? 22,
                fontWeight: style?.fontWeight,
                color: style?.color,
              )
              : style,
      textDirection: textDirection,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
