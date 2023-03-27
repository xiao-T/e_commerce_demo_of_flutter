// category detail
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryDetail extends StatelessWidget {
  final String categoryId;
  const CategoryDetail({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Detail Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Category ID: $categoryId'),
            ElevatedButton(
              child: const Text('back to home'),
              onPressed: () {
                GoRouter.of(context).go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
