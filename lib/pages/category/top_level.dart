// category top level

import 'package:e_mall_demo/pages/category/read_countries_JSON.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class TopLevel extends StatefulWidget {
  const TopLevel({Key? key}) : super(key: key);

  @override
  State<TopLevel> createState() => _TopLevelState();
}

class _TopLevelState extends State<TopLevel> {
  String _currentCountry = '';
  List _countries = [];
  Future<void> _readJson() async {
    final countries = await readCountriesJSON();
    setState(() {
      _countries = countries;
      _currentCountry = countries.elementAt(0)['name'];
    });
  }

  void _switchCountry(country) {
    setState(() {
      _currentCountry = country['name'];
    });
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
      child: ListView(
        children: [..._createListView()],
      ),
    );
  }
}
