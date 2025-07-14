import 'package:flutter/material.dart';
import 'package:flutter_go_example/layout/layout_scaffold.dart';
import 'package:flutter_go_example/models/user.dart';
import 'package:flutter_go_example/pages/details_page.dart';
import 'package:flutter_go_example/pages/explore_page.dart';
import 'package:flutter_go_example/pages/home_page.dart';
import 'package:flutter_go_example/pages/profile_page.dart';
import 'package:flutter_go_example/pages/settings_page.dart';
import 'package:flutter_go_example/pages/sign_in_page.dart';
import 'package:flutter_go_example/router/routes.dart';

import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final tabRoutes = StatefulShellRoute.indexedStack(
  builder: (context, state, navigationShell) =>
      LayoutScaffold(navigationShell: navigationShell),
  branches: [
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: Routes.homePage,
          builder: (context, state) => const HomePage(),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: Routes.explorePage,
          builder: (context, state) => const ExplorePage(),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: Routes.settingsPage,
          builder: (context, state) => const SettingsPage(),
          routes: [
            GoRoute(
              path: "profile",
              builder: (context, state) =>
                  ProfilePage(user: state.extra as User),
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRouter getRouter({
  String? initialLocation,
  required bool isLoggedIn,
  required bool isLoading,
  required dynamic error,
}) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialLocation ?? Routes.initialPage,
    routes: [
      ShellRoute(
        redirect: (context, state) {
          if (isLoading || error != null) return null;

          final inPrivatePage = state.matchedLocation != Routes.signIn;
          if (isLoggedIn && !inPrivatePage) {
            return Routes.homePage;
          } else if (!isLoggedIn) {
            return Routes.signIn;
          }
          return null;
        },
        builder: (context, state, navigationShell) {
          if (isLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (error != null) {
            return Scaffold(
              body: Center(child: Text("Failed to login $error")),
            );
          }
          return navigationShell;
        },
        routes: [
          GoRoute(
            path: Routes.signIn,
            builder: (context, state) => SignInPage(),
          ),
          tabRoutes,
          GoRoute(
            path: Routes.detailsPage,
            builder: (context, state) => DetailsPage(),
          ),
        ],
      ),
    ],
  );
}
