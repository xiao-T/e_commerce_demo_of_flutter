// shopping cart provider

import 'package:flutter/material.dart';

List<dynamic> defaultProducts = [
  {
    'id': '1',
    'url': 'https://picsum.photos/id/27/400/400',
    'price': '13.89',
    'qty': 1,
    'selected': true,
  },
  {
    'id': '2',
    'url': 'https://picsum.photos/id/32/400/400',
    'price': '32.00',
    'qty': 1,
    'selected': true,
  },
  {
    'id': '3',
    'url': 'https://picsum.photos/id/33/400/400',
    'price': '14.80',
    'qty': 1,
    'selected': !true,
  },
  {
    'id': '4',
    'url': 'https://picsum.photos/id/34/400/400',
    'price': '34.50',
    'qty': 2,
    'selected': true,
  },
];

class ShoppingCartModel with ChangeNotifier {
  final List<dynamic> _products = [...defaultProducts];
  List<dynamic> get _selectedProducts =>
      _products.where((product) => product['selected']).toList();

  List<dynamic> get products => _products.map((product) => product).toList();

  num get count {
    return _selectedProducts.fold(
      0,
      (previousValue, current) => previousValue += current['qty'],
    );
  }

  String get totalAmount {
    double amount = _selectedProducts.fold(
      0,
      (previousValue, current) =>
          previousValue += current['qty'] * double.parse(current['price']),
    );
    return amount.toStringAsFixed(2);
  }

  bool get isAllSelected {
    return _products.length == _selectedProducts.length;
  }

  void add(product) {
    _products.add(product);
    notifyListeners();
  }

  void delete(product) {
    int index = _products.indexOf(product);
    _products.removeAt(index);
    notifyListeners();
  }

  void selectAll(bool? status) {
    for (var product in _products) {
      product['selected'] = status;
    }
    notifyListeners();
  }

  void updateSingleProduct(bool? status, String productId) {
    for (var product in _products) {
      if (product['id'] == productId) {
        product['selected'] = status;
      }
    }
    notifyListeners();
  }
}
