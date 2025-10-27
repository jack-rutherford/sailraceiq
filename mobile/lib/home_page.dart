import 'package:flutter/material.dart';
import 'package:mobile/util/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navIfDiff(BuildContext context, String routeName) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != routeName) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title.toUpperCase()),
        ),
        drawer: Drawer(
          child: Builder(builder: (context) {
            return Container(
                color: Theme.of(context).colorScheme.inversePrimary,
                child: ListView(
                  children: [
                    // ListTile(
                    //   onTap: () {
                    //     navIfDiff(context, Routes.timerPage);
                    //   },
                    //   title: Text(
                    //     "Timer",
                    //     style: TextStyle(
                    //         color: Theme.of(context).colorScheme.secondary),
                    //   ),
                    //   leading: const Icon(Icons.timer_10, size: 40),
                    // )
                    ListTile(
                      onTap: () {
                        navIfDiff(context, Routes.scorePage);
                      },
                      title: Text(
                        "Score",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      leading: const Icon(Icons.timer_10, size: 40),
                    )
                  ],
                ));
          }),
        ));
  }
}
