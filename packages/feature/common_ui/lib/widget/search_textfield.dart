import 'package:flutter/material.dart';
import 'package:design_system/widget/app_textfield.dart';

class SearchTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onSearchTap; // New callback for icon tap
  final Widget? trailingIcon; // Customizable trailing icon
  final Color? iconColor; // Icon color
  final double iconSize; // Icon size

  const SearchTextfield({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.fillColor,
    this.contentPadding,
    this.onSearchTap,
    this.trailingIcon,
    this.iconColor,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      fillColor: fillColor ?? Theme.of(context).colorScheme.surface,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintText: hintText,
      suffixIcon: IconButton(
        icon: trailingIcon ??
            Icon(
              Icons.search,
              color: iconColor ?? Theme.of(context).colorScheme.primary,
              size: iconSize,
            ),
        onPressed: onSearchTap, // Call the search function when tapped
      ),
    );
  }
}
