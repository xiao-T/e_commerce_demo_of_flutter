// category detail
import 'package:e_mall_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Detail Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('back to home'),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
      ),
    );
  }
}
