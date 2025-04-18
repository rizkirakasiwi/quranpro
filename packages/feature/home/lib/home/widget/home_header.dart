import 'package:design_system/color.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final Widget? child;
  const HomeHeader({super.key, this.child});

    @override
    Widget build(BuildContext context) {
      return ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                AppColors.primary4,
                AppColors.primary2,
                AppColors.primary3,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      );
    }
}
