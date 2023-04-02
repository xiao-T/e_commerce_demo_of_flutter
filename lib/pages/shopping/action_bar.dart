// shopping cart bottom action bar
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  value: true,
                  onChanged: (value) {
                    print('check all');
                  },
                ),
              ),
              const Text('Select All'),
            ],
          ),
          Row(
            children: [
              Text(
                'Total: ¥143.34',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                width: gap['m']!,
              ),
              ElevatedButton(
                onPressed: () {
                  print('checkout....');
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
