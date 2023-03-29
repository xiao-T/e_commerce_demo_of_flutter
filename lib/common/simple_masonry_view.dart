// simple masonry view

import 'package:flutter/material.dart';

class SimpleMasonryView extends StatelessWidget {
  const SimpleMasonryView({
    Key? key,
    required this.countOfColumn,
    required this.items,
    required this.itemBuilder,
    spacing,
  }) : super(key: key);

  final int countOfColumn;
  final List<dynamic> items;
  final double spacing = 8.0;
  final Widget Function(dynamic) itemBuilder;

  List<dynamic> _createItemGroup(int startIndex) {
    final List<dynamic> group = [];
    for (var i = startIndex; i < items.length; i += countOfColumn) {
      group.add(items.elementAt(i));
    }
    return group;
  }

  Widget _createColumn(List<dynamic> group) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: group.map((dynamic item) => itemBuilder(item)).toList(),
      ),
    );
  }

  List<Widget> _createRow() {
    final List<Widget> row = [];
    for (var i = 0; i < countOfColumn; i++) {
      row.add(_createColumn(_createItemGroup(i)));
      if (i < countOfColumn - 1) {
        row.add(SizedBox(width: spacing));
      }
    }
    return row;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _createRow(),
    );
  }
}
