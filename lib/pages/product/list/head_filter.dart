// product list head filter

import 'package:e_mall_demo/models/product_list.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadFilter extends StatelessWidget {
  const HeadFilter({Key? key}) : super(key: key);

  List<Widget> _createFilter(ProductListModel provider) {
    List<String> filters = provider.filters;
    String currentFilter = provider.currentFilter;
    List<Widget> list = [];
    for (var filter in filters) {
      list.add(
        GestureDetector(
          onTap: () {
            provider.updateCurrentFilter(filter);
          },
          child: Container(
            margin: EdgeInsets.only(right: gap['l']!),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: currentFilter == filter ? Colors.black : Colors.white,
                ),
              ),
            ),
            child: Text(
              filter.toString().toUpperCase(),
              style: TextStyle(
                color: currentFilter == filter ? Colors.black : Colors.black38,
              ),
            ),
          ),
        ),
      );
    }
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    final productListProvider = context.watch<ProductListModel>();
    return Row(
      children: _createFilter(productListProvider),
    );
  }
}
