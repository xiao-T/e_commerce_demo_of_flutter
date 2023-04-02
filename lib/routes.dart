// App routes
import 'package:e_mall_demo/models/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'common/slider_page_route_builder.dart';
import './scaffold_with_nav_bar.dart';
import 'pages/home/home.dart';
// category page
import './pages/category/category.dart';
import './pages/category/detail.dart';
// profile
import 'pages/about/about.dart';
// login
import 'pages/login/login.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
GoRouter shellRoute = GoRouter(
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
              child: HomePage(),
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
          redirect: (BuildContext context, GoRouterState state) {
            var loginProvider = context.read<LoginModel>();
            // authGurad(context, state);
            if (loginProvider.isSignedIn) {
              return null;
            } else {
              return '/login';
              // return shellRoute.namedLocation('/login');
            }
          },
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      // builder: (BuildContext context, GoRouterState state) {
      //   return const LoginPage();
      // },
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const SliderPageRouteBuilder(
          child: LoginPage(),
        );
      },
    ),
  ],
);

// String authGurad(BuildContext context, GoRouterState) {
//   print(shellRoute.namedLocation('login'));
//   return '';
// }
