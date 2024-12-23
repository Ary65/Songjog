import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:songjog/constants/colors.dart';
import 'package:songjog/localizations/app_locale.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int selectedPageIndex = 0;
  final FlutterLocalization localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    debugPrint(localization.currentLocale?.languageCode);
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        indicatorColor: AppColors.primaryColor.withOpacity(.2),
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (int index) => _onTap(context, index),
        destinations: <NavigationDestination>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.home),
            icon: const Icon(Icons.home_outlined),
            label: AppLocale.menu1.getString(context),
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.grid_view_sharp),
            icon: const Icon(Icons.grid_view_outlined),
            label: AppLocale.menu2.getString(context),
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.shopping_bag),
            icon: const Icon(Icons.shopping_bag_outlined),
            label: AppLocale.menu3.getString(context),
            enabled: true,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.person_2),
            icon: const Icon(Icons.person_2_outlined),
            label: AppLocale.menu4.getString(context),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
