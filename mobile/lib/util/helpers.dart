import 'package:flutter/material.dart';

void navIfDiff(BuildContext context, String routeName) {
  final currentRoute = ModalRoute.of(context)?.settings.name;
  if (currentRoute != routeName) {
    Navigator.pushNamed(context, routeName);
  }
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