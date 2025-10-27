import 'package:flutter/material.dart';
import 'package:mobile/home_page.dart';
import 'package:mobile/timer_page.dart';
import 'package:mobile/util/routes.dart';
import 'package:mobile/util/themes.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  final title = "sailrace iq";

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routes: {
        Routes.homePage: (context) => HomePage(title: widget.title),
        Routes.timerPage: (context) => TimerPage(),
      }
    );
  }
}
