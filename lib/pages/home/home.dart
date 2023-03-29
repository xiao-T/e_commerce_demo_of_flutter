import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'hot_words.dart';
import 'iconic.dart';
import 'new_arrival.dart';
import 'top_sale.dart';
import 'hot_share.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Iconic(),
          const NewArrival(),
          HotWords(),
          const TopSale(),
          HotShare(),
          ElevatedButton(
            onPressed: () {
              context.go('/category');
            },
            child: const Text('Tap on it to category page'),
          ),
        ],
      ),
    );
  }
}
