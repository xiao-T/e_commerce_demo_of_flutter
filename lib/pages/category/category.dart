import 'package:e_mall_demo/pages/category/sub_level.dart';
import 'package:e_mall_demo/pages/category/top_level.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category Page'),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: 120.0,
              child: TopLevel(),
            ),
            Expanded(
              child: SubLevel(),
            )
          ],
        ));
  }
}
