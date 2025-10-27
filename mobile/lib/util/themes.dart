import 'package:flutter/material.dart';
import 'package:mobile/util/colors.dart';

// Defines light and dark themes for SailRaceIQ
class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Palette.primary,
    scaffoldBackgroundColor: Palette.backgroundLight,
    colorScheme: ColorScheme.light(
      primary: Palette.primary,
      secondary: Palette.secondary,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Palette.backgroundDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.primary,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Palette.primary,
    scaffoldBackgroundColor: Palette.backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: Palette.primary,
      secondary: Palette.secondary,
      surface: Color(0xFF1D2F45),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Palette.backgroundLight,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1D2F45),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}