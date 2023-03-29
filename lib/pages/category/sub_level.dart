// category sub level
import 'dart:math';
import 'package:e_mall_demo/pages/category/read_countries_JSON.dart';
import 'package:e_mall_demo/styles.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

final subLevelContainer = GlobalKey();
Future randomData(count) async {
  final countries = await readCountriesJSON();
  for (var i = 0; i < countries.length; i++) {
    final randomCityCount = Random().nextInt(count) + (count ~/ 2);
    countries.elementAt(i)['cities'] =
        List.generate(randomCityCount.toInt(), (i) => i);
  }
  return countries;
}

class SubLevel extends StatefulWidget {
  const SubLevel({Key? key}) : super(key: key);

  @override
  State<SubLevel> createState() => _SubLevelState();
}

class _SubLevelState extends State<SubLevel> {
  List _countriesWithCities = [];

  List<Widget> _createSubCategoryItem(cities) {
    final double? containerWidth = _getSubLevelContainerSize();
    // 4 = container's horizontal padding + item between gap
    final double itemWidth = (containerWidth! - (gap['m']! * 4)) / 3;
    List<Widget> items = [];
    items = cities.map<Widget>((item) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: Image(
              width: itemWidth,
              height: itemWidth,
              fit: BoxFit.cover,
              image: NetworkImage(getRandomImageUrl()),
            ),
          ),
          SizedBox(
            height: gap['s']!,
          ),
          Text('City No. $item'),
        ],
      );
    }).toList();
    return items;
  }

  List<Widget> _createListView() {
    List<Widget> list = [];
    for (var country in _countriesWithCities) {
      list.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: gap['s']!),
              child: Text(
                country['name'],
                style: Styles.title.merge(
                  const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: gap['l']!),
              child: Wrap(
                spacing: gap['m']!,
                children: [
                  ..._createSubCategoryItem(country['cities']),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return list.toList();
  }

  double? _getSubLevelContainerSize() {
    RenderBox? renderBox =
        subLevelContainer.currentContext?.findRenderObject() as RenderBox?;
    double? containerWidth = renderBox?.size.width;
    return containerWidth;
  }

  @override
  void initState() {
    super.initState();
    randomData(5).then((r) {
      setState(() {
        _countriesWithCities = r;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: subLevelContainer,
      padding: EdgeInsets.symmetric(horizontal: gap['m']!, vertical: gap['l']!),
      child: ListView(
        children: [
          ..._createListView(),
        ],
      ),
    );
  }
}
