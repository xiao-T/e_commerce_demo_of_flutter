// bottom action bar

import 'dart:math';

import 'package:e_mall_demo/models/shopping_cart.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BottomActionBar extends StatelessWidget {
  BottomActionBar({
    Key? key,
    required this.id,
    required this.size,
  }) : super(key: key);

  String? id;
  String size;
  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = context.watch<ShoppingCartModel>();
    final bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: gap['m']!,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: gap['m']!,
              horizontal: gap['l']!,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: gap['m']!,
                  children: [
                    GestureDetector(
                      onTap: () => context.go('/'),
                      child: const Icon(Icons.home),
                    ),
                    GestureDetector(
                      onTap: () => context.go('/shopping'),
                      child: Badge(
                        smallSize: 0.0,
                        label: shoppingCartProvider.count > 0
                            ? Text(shoppingCartProvider.count.toString())
                            : null,
                        child: const Icon(Icons.shopping_cart),
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: gap['l']!,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        var randomProduct = {
                          'id': id,
                          'size': size.toUpperCase(),
                          'price':
                              (Random().nextDouble() * 100).toStringAsFixed(2),
                          'url': getRandomImageUrl(),
                          'qty': 1,
                          'selected': true
                        };
                        shoppingCartProvider.add(randomProduct);
                      },
                      label: const Text('Add To Cart'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('tap buy now');
                      },
                      child: const Text('Buy Now'),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: bottomBarHeight,
          )
        ],
      ),
    );
  }
}
