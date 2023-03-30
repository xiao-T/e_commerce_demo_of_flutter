// category top level

import 'dart:async';

import 'package:e_mall_demo/pages/category/read_countries_JSON.dart';
import 'package:e_mall_demo/pages/category/utils.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class TopLevel extends StatefulWidget {
  String currentCountryName;
  TopLevel({
    Key? key,
    required this.onCountryChange,
    this.currentCountryName = '',
  }) : super(key: key);

  Function onCountryChange;
  @override
  State<TopLevel> createState() => _TopLevelState();
}

class _TopLevelState extends State<TopLevel> {
  String _currentCountry = '';
  List _countries = [];

  Future<void> _readJson() async {
    final countries = await readCountriesJSON();
    setState(() {
      _countries = countries.map((country) {
        country['key'] = GlobalKey(debugLabel: country['name']);
        return country;
      }).toList();
      if (widget.currentCountryName != '') {
        _currentCountry = widget.currentCountryName;
      } else {
        _currentCountry = countries.elementAt(0)['name'];
      }
    });
    _scrollIntoView(_currentCountry);
  }

  void _switchCountry(country) {
    setState(() {
      _currentCountry = country['name'];
    });
    _scrollIntoView(_currentCountry);
    widget.onCountryChange(country);
  }

  void _scrollIntoView(String countryName) {
    scrollIntoView(countryName, _countries);
  }

  List<Widget> _createListView() {
    List<Widget> items = [];
    for (var country in _countries) {
      items.add(
        GestureDetector(
          onTap: () {
            _switchCountry(country);
          },
          child: Container(
            key: country['key'],
            padding: EdgeInsets.symmetric(
                vertical: gap['l']!, horizontal: gap['s']!),
            decoration: BoxDecoration(
              color: country['name'].toString() == _currentCountry
                  ? const Color.fromRGBO(255, 87, 34, 0.3)
                  : Colors.white,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.black12,
                ),
              ),
            ),
            child: Text(
              country['name'].toString().toUpperCase(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _readJson();
  }

  @override
  void didUpdateWidget(covariant TopLevel oldWidget) {
    setState(() {
      _currentCountry = widget.currentCountryName;
    });
    _scrollIntoView(_currentCountry);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: gap['s']!,
            offset: Offset(0, gap['s']!),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ..._createListView(),
          ],
        ),
      ),
    );
  }
}
