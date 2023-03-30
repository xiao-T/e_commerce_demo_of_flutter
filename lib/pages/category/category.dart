import 'package:e_mall_demo/pages/category/sub_level.dart';
import 'package:e_mall_demo/pages/category/top_level.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String _currentCountryName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Page'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 120.0,
            child: TopLevel(
              currentCountryName: _currentCountryName,
            ),
          ),
          Expanded(
            child: SubLevel(
              onScrollCallback: (currentCountry) {
                setState(() {
                  _currentCountryName = currentCountry['name'];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
