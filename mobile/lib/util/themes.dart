import 'package:flutter/material.dart';

// Primary color palette for SailRaceIQ
const List<Color> primaryColors = [
  Color(0xFF038AF5), // bright blue
  Color(0xFF070F21), // deep navy
  Color(0xFF11A0F3), // sky blue
  Color(0xFF1D2F45), // muted navy
  Color(0xFF536171), // blue-gray
];

// Secondary color palette
const List<Color> secondaryColors = [
  Color(0xFFF28755),
  Color(0xFFEF6E36),
];

// Tertiary color palette
const List<Color> tertiaryColors = [
  Color(0xFFED4002),
  Color(0xFFF6C7AA),
  Color(0xFFBCD8E7),
];

const List<Color> backgroundColors = [
  Color(0xFAF9F6FF),
  Color(0xFF1D2F45),
];

// Light theme palette
class LightPalette {
  static Color primary = primaryColors[0];
  static Color secondary = secondaryColors[0];
  static Color accent = tertiaryColors[0];
  static Color background = backgroundColors[0];
  static const Color surface = Colors.white;
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static Color onSurface = backgroundColors[1];
  static Color headline = primaryColors[1];
  static const Color bodyText = Colors.black87;
}

// Dark theme palette
class DarkPalette {
  static Color primary = primaryColors[0];
  static Color secondary = secondaryColors[0];
  static Color accent = tertiaryColors[0];
  static Color background = backgroundColors[1];
  static const Color surface = Color(0xFF1D2F45);
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static Color onSurface = backgroundColors[0];
  static const Color bodyLargeText = Colors.white;
  static const Color bodyMediumText = Colors.white70;
}

// Defines light and dark themes for SailRaceIQ
class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightPalette.primary,
    scaffoldBackgroundColor: LightPalette.background,
    colorScheme: ColorScheme.light(
      primary: LightPalette.primary,
      secondary: LightPalette.secondary,
      surface: LightPalette.surface,
      onPrimary: LightPalette.onPrimary,
      onSecondary: LightPalette.onSecondary,
      onSurface: LightPalette.onSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: LightPalette.primary,
      foregroundColor: LightPalette.onPrimary,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: LightPalette.headline,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        color: LightPalette.bodyText,
        fontSize: 18,
      ),
      bodyMedium: const TextStyle(
        color: LightPalette.bodyText,
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkPalette.primary,
    scaffoldBackgroundColor: DarkPalette.background,
    colorScheme: ColorScheme.dark(
      primary: DarkPalette.primary,
      secondary: DarkPalette.secondary,
      surface: DarkPalette.surface,
      onPrimary: DarkPalette.onPrimary,
      onSecondary: DarkPalette.onSecondary,
      onSurface: DarkPalette.onSurface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1D2F45),
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: DarkPalette.bodyLargeText,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: DarkPalette.bodyLargeText,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        color: DarkPalette.bodyMediumText,
      ),
    ),
  );
}
