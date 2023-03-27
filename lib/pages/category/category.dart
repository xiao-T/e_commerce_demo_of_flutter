import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Page'),
      ),
      body: Center(
        child: Column(children: [
          const Text('Category page body'),
          ElevatedButton(
            onPressed: () {
              print('tapped on category btn');
              GoRouter.of(context).go('/category/testId');
            },
            child: const Text('navigate to category detail page'),
          ),
        ]),
      ),
    );
  }
}
