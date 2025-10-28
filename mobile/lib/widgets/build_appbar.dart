import 'package:flutter/material.dart';
import 'package:mobile/util/helpers.dart';
import 'package:mobile/util/routes.dart';
import 'package:mobile/widgets/default_drawer.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? customDrawer;

  const BuildAppBar({super.key, required this.title, this.customDrawer});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logoPath = isDark
        ? 'assets/sailraceiq_logo_dark.png'
        : 'assets/sailraceiq_logo_light.png';

    // If no drawer provided, use the default SailRaceIQ drawer
    final Widget? activeDrawer = customDrawer ?? const DefaultDrawer();

    return AppBar(
      leading: Builder(
        builder: (context) {
          final hasDrawer = activeDrawer != null;
          return hasDrawer
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )
              : const SizedBox();
        },
      ),
      title: SizedBox(
        height: kToolbarHeight * 2.5,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => navIfDiff(context, Routes.homePage),
          icon: Image.asset(logoPath, fit: BoxFit.contain),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}