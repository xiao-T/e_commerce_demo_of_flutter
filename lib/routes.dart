// App routes
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './scaffold_with_nav_bar.dart';
import 'pages/home/home.dart';
// category page
import './pages/category/category.dart';
import './pages/category/detail.dart';
import './pages/about.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final GoRouter shellRoute = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(
          key: state.pageKey,
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const NoTransitionPage(
              child: HomePage(title: 'Home'),
            );
          },
        ),
        GoRoute(
          path: '/category',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const NoTransitionPage(
              child: CategoryPage(),
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: ':id',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return CategoryDetail(
                  categoryId: state.params['id']!,
                );
              },
            )
          ],
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const NoTransitionPage(
              child: AboutPage(),
            );
          },
        )
      ],
    ),
  ],
);
