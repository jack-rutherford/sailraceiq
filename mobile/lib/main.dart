import 'package:flutter/material.dart';
import 'package:mobile/pages/home_page.dart';
import 'package:mobile/pages/regatta_page.dart';
import 'package:mobile/util/helpers.dart';
import 'package:mobile/util/routes.dart';
import 'package:mobile/util/themes.dart';
import 'package:mobile/widgets/build_appbar.dart';
import 'package:mobile/widgets/default_drawer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  final title = "SailraceIQ";

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      // title: widget.title,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeNotifier.themeMode,
      routes: {
        Routes.homePage: (context) => Scaffold(
              appBar: BuildAppBar(title: "Home", onThemeToggle: themeNotifier.toggleTheme),
              drawer: DefaultDrawer(onThemeToggle: themeNotifier.toggleTheme),
              body: const HomePage(title: "SailraceIQ"),
            ),
        Routes.regattaPage: (context) => Scaffold(
              appBar: BuildAppBar(title: "Regatta", onThemeToggle: themeNotifier.toggleTheme),
              drawer: DefaultDrawer(onThemeToggle: themeNotifier.toggleTheme),
              body: const RegattaPage(),
            ),
        // Routes.scorePage: (context) => ScorePage(),
        // Routes.regattaPage: (context) => RegattaPage(name: name),
      },
    );
  }
}
