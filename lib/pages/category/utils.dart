// utils for category page
import 'package:flutter/material.dart';

void scrollIntoView(
  String countryName,
  List countries, {
  double alignment = 0.9,
}) {
  GlobalKey key = GlobalKey();
  for (var i = 0; i < countries.length; i++) {
    final country = countries.elementAt(i);
    if (country['name'] == countryName) {
      key = country['key'];
      break;
    }
  }
  if (key.currentContext != null) {
    Scrollable.ensureVisible(
      key.currentContext!,
      alignment: alignment,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
  }
}
