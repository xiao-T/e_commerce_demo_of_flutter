// return countries json
import 'dart:convert';
import 'package:flutter/services.dart';

Future readCountriesJSON() async {
  final String res =
      await rootBundle.loadString('assets/mock/MOCK_COUNTRIES.json');
  final countries = await json.decode(res);

  return countries;
}
