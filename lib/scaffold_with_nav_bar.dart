// scaffold with nav bar

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import './models/shopping_cart.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  int _calculateNavBarIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/category')) {
      return 1;
    } else if (location.startsWith('/shopping')) {
      return 2;
    } else if (location.startsWith('/about')) {
      return 3;
    } else {
      return 0;
    }
  }

  void _onTap(int index, BuildContext context) {
    if (index == 0) {
      GoRouter.of(context).go('/');
    }
    if (index == 1) {
      GoRouter.of(context).go('/category');
    }
    if (index == 2) {
      GoRouter.of(context).go('/shopping');
    }
    if (index == 3) {
      GoRouter.of(context).go('/about');
    }
  }

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = context.watch<ShoppingCartModel>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              smallSize: 0.0,
              label: shoppingCartProvider.count > 0
                  ? Text(shoppingCartProvider.count.toString())
                  : null,
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Shopping',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
        ],
        showUnselectedLabels: true,
        currentIndex: _calculateNavBarIndex(context),
        onTap: (index) => _onTap(index, context),
      ),
      body: child,
    );
  }
}
