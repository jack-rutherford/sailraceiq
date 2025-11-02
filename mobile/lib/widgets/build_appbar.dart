import 'package:flutter/material.dart';
import 'package:mobile/pages/home_page.dart';
import 'package:mobile/util/helpers.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onThemeToggle;

  const BuildAppBar({super.key, required this.title, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoPath = isDark
        ? 'assets/sailraceiq_logo_dark.png'
        : 'assets/sailraceiq_logo_light.png';

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: SizedBox(
        height: kToolbarHeight * 2.5,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => navIfDiff(context, HomePage(title: title)),
          icon: Image.asset(logoPath, fit: BoxFit.contain),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}