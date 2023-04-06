// App routes
import 'package:e_mall_demo/models/login.dart';
import 'package:e_mall_demo/pages/shopping/shopping.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'common/slider_page_route_builder.dart';
import './scaffold_with_nav_bar.dart';
import 'pages/home/home.dart';
// category page
import './pages/category/category.dart';
// profile
import 'pages/about/about.dart';
// login
import 'pages/login/login.dart';
// product detail
import 'pages/product/detail/detail.dart';
import 'pages/product/list/list.dart';

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
        ),
        GoRoute(
          path: '/shopping',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const NoTransitionPage(
              child: Shopping(),
            );
          },
          redirect: (BuildContext context, GoRouterState state) {
            return authGuard(context, state);
          },
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const NoTransitionPage(
              child: AboutPage(),
            );
          },
          redirect: (BuildContext context, GoRouterState state) {
            return authGuard(context, state);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const SliderPageRouteBuilder(
          child: LoginPage(),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/product/:id',
      builder: (BuildContext context, GoRouterState state) =>
          ProductDetail(id: state.params['id']),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/product/list/:listId',
      builder: (BuildContext context, GoRouterState state) =>
          ProductList(listId: state.params['listId']),
    ),
  ],
);

String? authGuard(BuildContext context, GoRouterState state) {
  var loginProvider = context.read<LoginModel>();
  if (loginProvider.isSignedIn) {
    return null;
  } else {
    return '/login?from=${state.location}';
  }
}
