// shopping cart provider

import 'package:flutter/material.dart';

class ShoppingCartModel with ChangeNotifier {
  final List<dynamic> _products = [];
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
    bool hasSameProduct = false;
    for (var i = 0; i < _products.length; i++) {
      if (_products.elementAt(i)['id'] == product['id'] &&
          _products.elementAt(i)['size'] == product['size']) {
        hasSameProduct = true;
        _products.elementAt(i)['qty'] += 1;
        break;
      }
    }
    if (!hasSameProduct) {
      _products.add(product);
    }
    notifyListeners();
  }

  void delete(product) {
    for (var i = 0; i < _products.length; i++) {
      var ele = _products.elementAt(i);
      if (ele['id'] == product['id'] &&
          ele['size'] == product['size'] &&
          ele['qty'] == product['qty']) {
        _products.removeAt(i);
        break;
      }
    }

    notifyListeners();
  }

  void selectAll(bool? status) {
    for (var product in _products) {
      product['selected'] = status;
    }
    notifyListeners();
  }

  void updateSingleProduct(bool? status, Map product) {
    for (var p in _products) {
      if (p['id'] == product['id'] &&
          p['size'] == product['size'] &&
          p['qty'] == product['qty']) {
        product['selected'] = status;
      }
    }
    notifyListeners();
  }
}
