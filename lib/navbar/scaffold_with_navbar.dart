import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
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
  DateTime? lastBackPressTime;
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600]!,
    Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint(localization.currentLocale?.languageCode);
    return WillPopScope(
      onWillPop: () async {
        if (widget.navigationShell.currentIndex != 0) {
          // Navigate back to the home screen if not already there
          setState(() {
            widget.navigationShell.goBranch(0, initialLocation: true);
          });
          return false; // Prevent default back navigation
        }

        // Handle double back press to exit
        final now = DateTime.now();
        if (lastBackPressTime == null ||
            now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
          lastBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back again to exit'),
              duration: Duration(seconds: 2),
            ),
          );
          return false; // Prevent exit
        }
        return true; // Allow exit
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: colors[selectedPageIndex],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(.20),
                  offset: const Offset(0, 15),
                )
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: GNav(
                gap: 8,
                color: Colors.grey[800],
                activeColor: Colors.purple,
                iconSize: 24,
                tabBackgroundColor: Colors.purple.withOpacity(0.1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                duration: const Duration(milliseconds: 1000),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: AppLocale.menu1.getString(context),
                  ),
                  GButton(
                    icon: LineIcons.square,
                    text: AppLocale.menu2.getString(context),
                  ),
                  GButton(
                    icon: LineIcons.shoppingBag,
                    text: AppLocale.menu3.getString(context),
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: AppLocale.menu4.getString(context),
                  ),
                ],
                selectedIndex: widget.navigationShell.currentIndex,
                onTabChange: (index) {
                  _onTap(context, index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
