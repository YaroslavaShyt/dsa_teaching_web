import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

ThemeData scrollbarThemeData(BuildContext context) {
  final ColorScheme colorScheme = getColorScheme(context);
  return ThemeData(
    scrollbarTheme: ScrollbarTheme.of(context).copyWith(
      thumbVisibility: const WidgetStatePropertyAll(true),
      trackVisibility: const WidgetStatePropertyAll(true),
      thumbColor: WidgetStateProperty.all(colorScheme.onSurface),
      trackBorderColor: WidgetStateProperty.all(colorScheme.onSurface),
      trackColor: WidgetStateProperty.all(colorScheme.onSurface),
      thickness: const WidgetStatePropertyAll(8),
      radius: const Radius.circular(4),
    ),
  );
}
