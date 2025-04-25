import 'package:flutter/material.dart';

import 'app_color_theme.dart';

TextTheme getTextTheme(BuildContext context) => TextTheme(
      bodyMedium: _TextTheme.bodyMedium(context),
      labelMedium: _TextTheme.labelMedium(context),
      labelSmall: _TextTheme.labelSmall(context),
      titleLarge: _TextTheme.titleLarge(context),
    );

class _TextTheme {
  static TextStyle titleLarge(context) => TextStyle(
        fontSize: 24,
        shadows: [
          BoxShadow(
            color: getColorScheme(context).shadow.withValues(alpha: 0.2),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      );

  static TextStyle bodyMedium(context) => TextStyle(
        fontSize: 20,
        shadows: [
          BoxShadow(
            color: getColorScheme(context).shadow.withValues(alpha: 0.2),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      );

  static TextStyle labelMedium(context) => TextStyle(
        fontSize: 16,
        shadows: [
          BoxShadow(
            color: getColorScheme(context).shadow.withValues(alpha: 0.2),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      );

  static TextStyle labelSmall(context) => TextStyle(
        fontSize: 14,
        shadows: [
          BoxShadow(
            color: getColorScheme(context).shadow.withValues(alpha: 0.2),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      );
}
