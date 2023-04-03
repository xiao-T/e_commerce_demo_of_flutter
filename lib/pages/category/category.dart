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

  void _resetCurrentCountry(country) {
    setState(() {
      _currentCountryName = country['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 120.0,
            child: TopLevel(
                currentCountryName: _currentCountryName,
                onCountryChange: (currentCountry) {
                  _resetCurrentCountry(currentCountry);
                }),
          ),
          Expanded(
            child: SubLevel(
              currentCountryName: _currentCountryName,
              onScrollCallback: (currentCountry) {
                _resetCurrentCountry(currentCountry);
              },
            ),
          ),
        ],
      ),
    );
  }
}
