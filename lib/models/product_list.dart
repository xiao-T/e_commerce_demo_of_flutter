// product list provider

import 'package:flutter/material.dart';

class ProductListModel with ChangeNotifier {
  final List<String> filters = ['All', 'Hot', 'In Stock'];

  String currentFilter = 'All';

  void updateCurrentFilter(String newFilter) {
    currentFilter = newFilter;
    notifyListeners();
  }
}
