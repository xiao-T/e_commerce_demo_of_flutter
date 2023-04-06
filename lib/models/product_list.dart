// product list provider

import 'package:flutter/material.dart';

class ProductListModel with ChangeNotifier {
  final List<String> filters = ['All', 'Hot', 'In Stock'];

  String currentFilter = 'All';

  List<String> extraFilters = [];

  void updateCurrentFilter(String newFilter) {
    currentFilter = newFilter;
    notifyListeners();
  }

  void updateExtraFilters(String filter) {
    if (extraFilters.contains(filter)) {
      extraFilters.remove(filter);
    } else {
      extraFilters.add(filter);
    }
    notifyListeners();
  }

  void clearExtraFilters() {
    extraFilters.clear();
    notifyListeners();
  }
}
