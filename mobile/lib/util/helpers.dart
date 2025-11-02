import 'package:flutter/material.dart';

void navIfDiff(BuildContext context, Widget page) {
  final currentRoute = ModalRoute.of(context);
  if (currentRoute == null ||
      currentRoute.settings.name != page.runtimeType.toString()) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: page.runtimeType.toString()),
        builder: (context) => page,
      ),
    );
  }
}

/// Attempts to navigate back up to [maxDepth] pages or until the first route (home) is reached.
/// If the first route is reached, it stops popping without pushing a new page.
/// If after popping [maxDepth] pages home is not reached, it pushes a new instance of [homePage].
void navigateHomeSmart(BuildContext context, Widget homePage,
    {int maxDepth = 3}) {
  int popCount = 0;

  Navigator.popUntil(context, (route) {
    if (route.isFirst) {
      return true;
    }
    if (popCount >= maxDepth) {
      return true;
    }
    popCount++;
    return false;
  });

  if (popCount >= maxDepth) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: homePage.runtimeType.toString()),
        builder: (context) => homePage,
      ),
    );
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
