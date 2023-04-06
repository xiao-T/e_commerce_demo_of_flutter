// side filter for plp

import 'package:e_mall_demo/models/product_list.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SideFilter extends StatelessWidget {
  const SideFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final provider = context.watch<ProductListModel>();
    return Drawer(
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: padding.top + gap['xl']!,
                ),
                Text(
                  'More Filters',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: gap['l']!,
                ),
                SideFilterCard(
                  title: 'Color',
                  filters: List.generate(5, (index) => index),
                ),
                SideFilterCard(
                  title: 'Style',
                  filters: List.generate(8, (index) => index),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  provider.clearExtraFilters();
                },
                child: const Text('Reset'),
              ),
              SizedBox(
                width: gap['l']!,
              ),
              ElevatedButton(
                onPressed: () {
                  print(provider.extraFilters);
                  context.pop();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
          SizedBox(
            height: padding.bottom,
          ),
        ],
      ),
    );
  }
}

class SideFilterCard extends StatelessWidget {
  SideFilterCard({Key? key, required this.title, required this.filters})
      : super(key: key);

  String title;
  List filters;

  List<Widget> _createFilterItem(
      BuildContext context, ProductListModel provider) {
    List<Widget> list = [];
    List<String> extraFilters = provider.extraFilters;
    for (var filter in filters) {
      var filterFullName = '$title: NO. $filter';
      list.add(
        GestureDetector(
          onTap: () {
            provider.updateExtraFilters(filterFullName);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: gap['m']!,
              horizontal: gap['l']!,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: extraFilters.contains(filterFullName)
                    ? Colors.black
                    : Colors.black38,
              ),
            ),
            child: Text(
              filterFullName,
              style: Theme.of(context).textTheme.bodySmall?.merge(
                    TextStyle(
                      color: extraFilters.contains(filterFullName)
                          ? Colors.black
                          : Colors.black38,
                    ),
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
    final provider = context.watch<ProductListModel>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: gap['l']!, vertical: gap['m']!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: gap['m']!,
          ),
          Wrap(
            spacing: gap['m']!,
            runSpacing: gap['m']!,
            children: _createFilterItem(context, provider),
          )
        ],
      ),
    );
  }
}
