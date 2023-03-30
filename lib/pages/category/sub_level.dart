// category sub level
import 'dart:math';
import 'package:e_mall_demo/pages/category/read_countries_JSON.dart';
import 'package:e_mall_demo/styles.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

final debounce = Debounce(milliseconds: 100);
List countryItemKeys = [];
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
  SubLevel({Key? key, this.onScrollCallback}) : super(key: key);

  Function? onScrollCallback;
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
    // reset list
    countryItemKeys = [];
    for (var country in _countriesWithCities) {
      final cityItemKey = GlobalKey(debugLabel: country['name']);
      countryItemKeys.add(cityItemKey);
      list.add(
        Column(
          key: cityItemKey,
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
      widget.onScrollCallback!(_findVisibleItem());
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
    for (var i = 0; i < countryItemKeys.length; i++) {
      GlobalKey key = countryItemKeys.elementAt(i);
      Offset? offset = _getItemPosition(key);
      if (offset != null && offset.dy > 0) {
        currentCountry = _countriesWithCities.elementAt(i);
        currentCountry['key'] = key;
        currentCountry['offset'] = offset;
        break;
      }
    }
    return currentCountry;
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
  void dispose() {
    _scrollController.removeListener(_handleScrollEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: subLevelContainer,
      padding: EdgeInsets.symmetric(horizontal: gap['m']!, vertical: gap['l']!),
      child: ListView(
        controller: _scrollController,
        children: [
          ..._createListView(),
          ElevatedButton(
            onPressed: () {
              _scrollController.animateTo(
                1000.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            child: const Text('back to top'),
          ),
        ],
      ),
    );
  }
}
