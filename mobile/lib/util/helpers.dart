import 'package:flutter/material.dart';

void navIfDiff(BuildContext context, String routeName) {
  final currentRoute = ModalRoute.of(context)?.settings.name;
  if (currentRoute != routeName) {
    Navigator.pushNamed(context, routeName);
  }
}

// Get current season based on month
  String getCurrentSeason() {
    final month = DateTime.now().month;
    if (month >= 3 && month <= 5) return 'Spring';
    if (month >= 6 && month <= 8) return 'Summer';
    if (month >= 9 && month <= 11) return 'Fall';
    return 'Winter';
  }

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}