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

GoRouter getRouter(bool isLoggedIn) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.initialPage,
    routes: [
      GoRoute(
        path: Routes.signIn,
        builder: (context, state) => SignInPage(),
        redirect: (BuildContext context, GoRouterState state) {
          return isLoggedIn ? Routes.initialPage : null;
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          // Check auth status and redirect if needed
          if (!isLoggedIn) {
            // Redirect manually if needed
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go(Routes.signIn);
            });
            return SizedBox(); // return empty until redirect
          }

          // Otherwise, wrap child in shared layout
          return child;
        },
        routes: [
          tabRoutes,
          GoRoute(
            path: Routes.detailsPage,
            builder: (BuildContext context, GoRouterState state) {
              return const DetailsPage();
            },
          ),
        ],
      ),
    ],
  );
}
