// shopping cart page

import 'package:e_mall_demo/pages/shopping/action_bar.dart';
import 'package:flutter/material.dart';

import './shopping_cart_item.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ShoppingCartItem(),
                ShoppingCartItem(),
              ],
            ),
          ),
          const ActionBar(),
        ],
      ),
    );
  }
}
