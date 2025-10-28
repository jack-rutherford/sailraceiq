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
  Color(0x1C1B1AFF),
];

// Utility class for direct references
class Palette {
  static Color primary = primaryColors[0];
  static Color secondary = secondaryColors[0];
  static Color accent = tertiaryColors[0];
  static Color backgroundLight = backgroundColors[0];
  static Color backgroundDark = backgroundColors[1];
}