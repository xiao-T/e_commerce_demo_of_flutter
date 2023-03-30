// category sub level
import 'dart:math';
import 'package:e_mall_demo/pages/category/read_countries_JSON.dart';
import 'package:e_mall_demo/pages/category/utils.dart';
import 'package:e_mall_demo/styles.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

final debounce = Debounce(milliseconds: 100);
final subLevelContainer = GlobalKey();
Future randomData(count) async {
  final countries = await readCountriesJSON();
  for (var i = 0; i < countries.length; i++) {
    final randomCityCount = Random().nextInt(count) + (count ~/ 2);
    final country = countries.elementAt(i);
    country['key'] = GlobalKey(debugLabel: country['name']);
    country['cities'] = List.generate(randomCityCount.toInt(), (i) => i);
  }
  return countries;
}

class SubLevel extends StatefulWidget {
  String currentCountryName;
  SubLevel({
    Key? key,
    required this.onScrollCallback,
    this.currentCountryName = '',
  }) : super(key: key);

  Function onScrollCallback;
  @override
  State<SubLevel> createState() => _SubLevelState();
}

class _SubLevelState extends State<SubLevel> {
  List _countriesWithCities = [];
  final ScrollController _scrollController = ScrollController();

  // create city item layout
  List<Widget> _createSubCityItem(cities) {
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
          key: country['key'],
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
                runSpacing: gap['m']!,
                children: [
                  ..._createSubCityItem(country['cities']),
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

  // scroll event
  void _handleScrollEvent() {
    debounce.run(() {
      widget.onScrollCallback(_findVisibleItem());
    });
  }

  // get position of sub category item
  Offset? _getItemPosition(GlobalKey key) {
    RenderBox? renderBoxItem =
        key.currentContext?.findRenderObject() as RenderBox?;
    Offset? itemPosition = renderBoxItem?.localToGlobal(Offset.zero);
    return itemPosition;
  }

  // layout completed callback
  Map<String, dynamic> _findVisibleItem() {
    Map<String, dynamic> currentCountry = {};
    for (var i = 0; i < _countriesWithCities.length; i++) {
      GlobalKey key = _countriesWithCities.elementAt(i)['key'];
      Offset? offset = _getItemPosition(key);
      if (offset != null && offset.dy > 0) {
        currentCountry = _countriesWithCities.elementAt(i);
        currentCountry['offset'] = offset;
        break;
      }
    }
    return currentCountry;
  }

  void _scrollIntoView(String countryName) {
    scrollIntoView(countryName, _countriesWithCities, alignment: 0.0);
  }

  @override
  void initState() {
    _scrollController.addListener(_handleScrollEvent);
    randomData(5).then((r) {
      setState(() {
        _countriesWithCities = r;
      });
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SubLevel oldWidget) {
    _scrollIntoView(widget.currentCountryName);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScrollEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: subLevelContainer,
      padding: EdgeInsets.symmetric(horizontal: gap['m']!, vertical: gap['l']!),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ..._createListView(),
          ],
        ),
      ),
    );
  }
}
