import 'package:flutter/material.dart';
import 'package:mobile/pages/home_page.dart';
import 'package:mobile/util/routes.dart';
import 'package:mobile/util/themes.dart';
import 'package:mobile/widgets/build_appbar.dart';
import 'package:mobile/widgets/default_drawer.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  final title = "SailraceIQ";

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // PreferredSizeWidget buildAppBar(BuildContext context, String title) {
  //   final isDark = Theme.of(context).brightness == Brightness.dark;
  //   final logoPath = isDark
  //       ? 'assets/sailraceiq_logo_dark.png'
  //       : 'assets/sailraceiq_logo_light.png';

  //   return AppBar(
  //     leading: Builder(
  //       builder: (context) {
  //         final hasDrawer = Scaffold.maybeOf(context)?.hasDrawer ?? false;
  //         return hasDrawer
  //             ? IconButton(
  //                 icon: const Icon(Icons.menu),
  //                 onPressed: () => Scaffold.of(context).openDrawer(),
  //               )
  //             : const SizedBox();
  //       },
  //     ),
  //     title: SizedBox(
  //       height: kToolbarHeight * 0.7,
  //       child: IconButton(
  //         padding: EdgeInsets.zero,
  //         onPressed: () => navIfDiff(context, Routes.homePage),
  //         icon: Image.asset(logoPath, fit: BoxFit.contain),
  //       ),
  //     ),
  //     centerTitle: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: widget.title,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routes: {
        Routes.homePage: (context) => Scaffold(
              appBar: const BuildAppBar(title: "Home",),
              drawer: const DefaultDrawer(),
              body: const HomePage(title: "SailraceIQ"),
            ),
        // Routes.scorePage: (context) => ScorePage(),
        // Routes.regattaPage: (context) => RegattaPage(name: name),
      },
    );
  }
}
