// top sale for home page
import 'package:e_mall_demo/utils.dart';
import 'package:e_mall_demo/styles.dart';
import 'package:flutter/material.dart';

class TopSale extends StatelessWidget {
  const TopSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: gap['l']!, bottom: gap['l']!),
      child: Column(
        children: [
          Text(
            '热卖商品',
            style: Styles.title,
          ),
          SizedBox(
            height: gap['l']!,
          ),
          ProductList()
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  final List _products = [
    {
      'url': 'https://picsum.photos/id/27/400/400',
      'name': 'Paul Jarvis',
      'price': '132.89',
    },
    {
      'url': 'https://picsum.photos/id/32/400/400',
      'name': 'Paul Jarvis',
      'price': '3432.00',
    },
    {
      'url': 'https://picsum.photos/id/33/400/400',
      'name': 'Paul Jarvis',
      'price': '3554.80',
    },
    {
      'url': 'https://picsum.photos/id/34/400/400',
      'name': 'Vadim Sherbakov',
      'price': '34.50',
    },
  ];
  final List<Widget> _productList = [];
  List<Widget> _generateProductList(double itemWidth, BuildContext context) {
    for (var product in _products) {
      _productList.add(
        Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: itemWidth,
                height: itemWidth,
                image: NetworkImage(product['url']),
              ),
              SizedBox(
                height: gap['s']!,
              ),
              Text(
                product['name'],
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: gap['s']!,
              ),
              Text(
                "价格：¥${product['price']}",
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
        ),
      );
    }
    return _productList;
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 3.5;
    return SizedBox(
      height: 170.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ..._generateProductList(itemWidth, context),
          ..._generateProductList(itemWidth, context)
        ],
      ),
    );
  }
}
