// shopping cart page

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import './action_bar.dart';
import './shopping_cart_item.dart';
import '../../models/shopping_cart.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = context.watch<ShoppingCartModel>();
    final products = shoppingCartProvider.products;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: products.isNotEmpty
                ? ListView(
                    children: products
                        .map(
                          (product) => ShoppingCartItem(item: product),
                        )
                        .toList(),
                  )
                : const ExploreButton(),
          ),
          const ActionBar(),
        ],
      ),
    );
  }
}

class ExploreButton extends StatelessWidget {
  const ExploreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Explore'),
        onPressed: () {
          context.go('/category');
        },
      ),
    );
  }
}
