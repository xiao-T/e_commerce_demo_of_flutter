// new arrival for home page
import 'package:e_mall_demo/styles.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

double productCardWidth = 0.0;
const double totalGap = 90.0;

class NewArrival extends StatelessWidget {
  const NewArrival({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    productCardWidth = (screenWidth - totalGap) / 2;
    return Container(
      padding: EdgeInsets.only(top: gap['l']!, bottom: gap['l']!),
      child: Column(
        children: [
          Text(
            '新品到货',
            style: Styles.title,
          ),
          const NewArrivalTab(),
        ],
      ),
    );
  }
}

class NewArrivalTab extends StatelessWidget {
  const NewArrivalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            padding: EdgeInsets.only(bottom: gap['m']!),
            indicatorPadding: EdgeInsets.only(bottom: gap['m']!),
            tabs: const [
              Tab(text: '男装'),
              Tab(text: '女装'),
              Tab(text: '配饰'),
            ],
          ),
          SizedBox(
            height: setResponseSize(420.0),
            child: TabBarView(
              children: [
                TabContent(),
                TabContent(),
                TabContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  TabContent({Key? key}) : super(key: key);

  final List _products = [
    {
      'id': '1',
      'url': 'https://picsum.photos/id/27/400/400',
      'name': 'Paul Jarvis',
      'price': '132.89',
    },
    {
      'id': '2',
      'url': 'https://picsum.photos/id/32/400/400',
      'name': 'Paul Jarvis',
      'price': '3432.00',
    },
    {
      'id': '3',
      'url': 'https://picsum.photos/id/33/400/400',
      'name': 'Paul Jarvis',
      'price': '3554.80',
    },
    {
      'id': '4',
      'url': 'https://picsum.photos/id/34/400/400',
      'name': 'Vadim Sherbakov',
      'price': '34.50',
    },
  ];
  final List<Widget> _listWidgets = [];
  List<Widget> _generateListView(BuildContext context) {
    for (var product in _products) {
      _listWidgets.add(
        SizedBox(
          width: productCardWidth,
          child: GestureDetector(
            onTap: () => context.push('/product/${product["id"]}'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: productCardWidth,
                  image: NetworkImage(product['url']),
                ),
                SizedBox(
                  height: gap['s'],
                ),
                Text(
                  product['name'],
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: gap['s'],
                ),
                Text(
                  "价格：${product['price']}",
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
          ),
        ),
      );
    }
    return _listWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runSpacing: totalGap / 3,
      children: _generateListView(context),
    );
  }
}
