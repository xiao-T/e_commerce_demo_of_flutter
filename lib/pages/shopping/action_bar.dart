// shopping cart bottom action bar
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

import 'package:e_mall_demo/models/shopping_cart.dart';
import 'package:provider/provider.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = context.watch<ShoppingCartModel>();
    bool? selectAllValue = true;

    if (shoppingCartProvider.isAllSelected) {
      selectAllValue = true;
    }
    if (!shoppingCartProvider.isAllSelected && shoppingCartProvider.count > 0) {
      selectAllValue = null;
    }
    if (!shoppingCartProvider.isAllSelected &&
        shoppingCartProvider.count == 0) {
      selectAllValue = false;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: gap['l']!,
        vertical: gap['m']!,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: gap['m']!,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  tristate: shoppingCartProvider.count > 0 &&
                      !shoppingCartProvider.isAllSelected,
                  value: selectAllValue,
                  onChanged: (value) {
                    shoppingCartProvider.selectAll(value);
                  },
                ),
              ),
              Text(
                'Select All',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Total: ¥${shoppingCartProvider.totalAmount}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                width: gap['m']!,
              ),
              ElevatedButton(
                onPressed: shoppingCartProvider.count > 0
                    ? () {
                        print('checkout....');
                      }
                    : null,
                child: const Text('Checkout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
