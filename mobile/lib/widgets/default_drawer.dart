import 'package:flutter/material.dart';
import 'package:mobile/util/helpers.dart';
import 'package:mobile/util/routes.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          children: [
            // ListTile(
            //   onTap: () => navIfDiff(context, Routes.scorePage),
            //   leading: const Icon(Icons.timer_10, size: 40),
            //   title: Text(
            //     "Score",
            //     style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            //   ),
            // ),
            // ListTile(
            //   onTap: () => navIfDiff(context, Routes.timerPage),
            //   leading: const Icon(Icons.access_time),
            //   title: const Text("Timer"),
            // ),
          ],
        ),
      ),
    );
  }
}