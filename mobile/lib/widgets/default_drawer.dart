import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key, required this.onThemeToggle});

  final VoidCallback onThemeToggle;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    color: Theme.of(context).iconTheme.color,
                    onPressed: onThemeToggle,
                    icon: Icon(
                      Icons.wb_sunny,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
