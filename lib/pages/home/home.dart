import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'hot_words.dart';
import 'iconic.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Iconic(),
          HotWords(),
          const SizedBox(
            height: 30.0,
          ),
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
