// iconic component for home page
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class Iconic extends StatelessWidget {
  Iconic({Key? key}) : super(key: key);

  final List _iconicAssets = [
    {
      'url': 'https://picsum.photos/id/9/400/400',
      'name': 'Alejandro Escamilla',
    },
    {
      'url': 'https://picsum.photos/id/10/400/400',
      'name': 'Paul Jarvis',
    },
    {
      'url': 'https://picsum.photos/id/11/400/400',
      'name': 'Paul Jarvis',
    },
    {
      'url': 'https://picsum.photos/id/12/400/400',
      'name': 'Paul Jarvis',
    },
    {
      'url': 'https://picsum.photos/id/26/400/400',
      'name': 'Vadim Sherbakov',
    },
  ];
  final List<Widget> _listWidgets = [];
  List<Widget> _generateListView(itemSize) {
    for (var iconic in _iconicAssets) {
      _listWidgets.add(
        Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          child: Stack(
            children: [
              Image(
                image: NetworkImage(iconic['url']),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  width: itemSize,
                  padding: EdgeInsets.all(gap['m']!),
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  child: Text(
                    iconic['name'],
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    return _listWidgets;
  }

  @override
  Widget build(BuildContext context) {
    double itemSize = MediaQuery.of(context).size.width / 3.5;
    return SizedBox(
      height: itemSize,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: _generateListView(itemSize),
      ),
    );
  }
}
