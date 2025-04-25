import 'package:dsa_teaching_web/core/utils/theme/color_palette.dart';
import 'package:flutter/material.dart';

ColorScheme getColorScheme(BuildContext context) =>
    Theme.of(context).colorScheme;

class AppColorTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        fontFamily: 'Nunito',
        colorScheme: _lightColorScheme,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbVisibility: const WidgetStatePropertyAll(true),
          trackVisibility: const WidgetStatePropertyAll(false),
          thumbColor: WidgetStateProperty.all(
              _lightColorScheme.onSurface.withValues(alpha: 0.5)),
          thickness: const WidgetStatePropertyAll(8),
          radius: const Radius.circular(20),
        ),
      );

  static final ColorScheme _lightColorScheme = ColorScheme(
    surface: ColorPalette.rebeccaPurple,
    onSurface: ColorPalette.white,
    primary: ColorPalette.rebeccaPurple,
    onPrimary: ColorPalette.white,
    error: ColorPalette.crayola,
    secondary: ColorPalette.mintGreen,
    onSecondary: Colors.black,
    onError: ColorPalette.white,
    brightness: Brightness.light,
    shadow: ColorPalette.shadow,
    primaryFixed: ColorPalette.maize,
    primaryFixedDim: ColorPalette.crayola,
    onSecondaryContainer: ColorPalette.neatBlue,
    onInverseSurface: ColorPalette.lavanda,
    onPrimaryContainer: ColorPalette.grayMilk,
  );
}
