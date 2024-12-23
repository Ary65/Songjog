import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:songjog/features/auth/screens/login_screen.dart';
import 'package:songjog/features/home/screens/home_screen.dart';
import 'package:songjog/features/profile/screens/profile_screen.dart';

import 'package:songjog/navbar/scaffold_with_navbar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeNav');
final GlobalKey<NavigatorState> _searchNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'searchNav');
final GlobalKey<NavigatorState> _cartNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'cartNav');
final GlobalKey<NavigatorState> _profileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profileNav');

CustomTransitionPage<void> buildFadeTransitionPage(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    transitionDuration: const Duration(milliseconds: 200),
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/a',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) =>
                  buildFadeTransitionPage(context, state, const HomeScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _searchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) =>
                  buildFadeTransitionPage(context, state, const HomeScreen()),
              routes: <RouteBase>[
                // GoRoute(
                //   path: 'sub-cat',
                //   pageBuilder: (context, state) {
                //     final data = state.extra as cat.Datum;
                //     return buildFadeTransitionPage(
                //         context, state, SubcategoryPage(category: data));
                //   },
                //   routes: <RouteBase>[
                //     GoRoute(
                //       path: 'child-cat',
                //       pageBuilder: (context, state) {
                //         final data = state.extra as cat.Child;
                //         return buildFadeTransitionPage(context, state,
                //             ChildCategoryPage(subcategory: data));
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _cartNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/cart',
              pageBuilder: (context, state) => buildFadeTransitionPage(
                  context, state, const ProfileScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) => buildFadeTransitionPage(
                  context, state, const ProfileScreen()),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          buildFadeTransitionPage(context, state, const LoginScreen()),
    ),
  ],
);
