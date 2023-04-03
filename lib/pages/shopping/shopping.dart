// shopping cart page

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './action_bar.dart';
import './shopping_cart_item.dart';
import '../../models/shopping_cart.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = context.watch<ShoppingCartModel>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: shoppingCartProvider.products
                  .map(
                    (product) => ShoppingCartItem(item: product),
                  )
                  .toList(),
            ),
          ),
          const ActionBar(),
        ],
      ),
    );
  }
}
