// list
import 'package:e_mall_demo/models/shopping_cart.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final debounce = Debounce(milliseconds: 100);

const int maxPage = 5;
int currentPage = 1;

class Items extends StatefulWidget {
  Items({Key? key, required this.onReachBottom}) : super(key: key);

  Function onReachBottom;
  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final ScrollController _scrollController = ScrollController();

  List _products = [
    {
      'id': '1',
      'url': 'https://picsum.photos/id/27/400/400',
      'name': 'Paul Jarvis',
      'price': '132.89',
      'size': 'X',
    },
    {
      'id': '2',
      'url': 'https://picsum.photos/id/32/400/400',
      'name': 'Paul Jarvis',
      'price': '32.00',
      'size': 'm',
    },
    {
      'id': '3',
      'url': 'https://picsum.photos/id/33/400/400',
      'name': 'Paul Jarvis',
      'price': '34.80',
      'size': 'l',
    },
    {
      'id': '4',
      'url': 'https://picsum.photos/id/34/400/400',
      'name': 'Vadim Sherbakov',
      'price': '34.50',
      'size': 's',
    },
    {
      'id': '5',
      'url': 'https://picsum.photos/id/34/400/400',
      'name': 'Vadim Sherbakov',
      'price': '34.50',
      'size': 's',
    },
    {
      'id': '6',
      'url': 'https://picsum.photos/id/34/400/400',
      'name': 'Vadim Sherbakov',
      'price': '34.50',
      'size': 's',
    },
    {
      'id': '7',
      'url': 'https://picsum.photos/id/34/400/400',
      'name': 'Vadim Sherbakov',
      'price': '34.50',
      'size': 's',
    },
  ];

  List<Widget> _createItems() {
    List<Widget> list = [];
    for (var product in _products) {
      list.add(
        ProductCard(product: product),
      );
    }
    return list.toList();
  }

  // scroll event
  void _handleScroll() {
    debounce.run(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent - 100) {
        currentPage += 1;
        if (currentPage > maxPage) {
          widget.onReachBottom(true);
          return;
        }
        setState(() {
          _products += _products;
        });
      }
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_handleScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        padding: EdgeInsets.all(gap['l']!),
        child: Wrap(
          spacing: gap['l']!,
          runSpacing: gap['l']!,
          children: _createItems(),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.product}) : super(key: key);

  Map product;
  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - gap['l']! * 3) / 2;
    final shoppingCartProvider = context.watch<ShoppingCartModel>();
    return Container(
      width: itemWidth,
      padding: EdgeInsets.only(bottom: gap['m']!),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: gap['s']!,
          ),
        ],
        borderRadius: BorderRadius.circular(gap['m']!),
      ),
      child: GestureDetector(
        onTap: () {
          context.push('/product/${product['id']}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(product['url'])),
            Padding(
              padding: EdgeInsets.all(gap['s']!),
              child: Text(
                product['name'],
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: gap['s']!, right: gap['s']!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '¥${product['price']}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      shoppingCartProvider.add({
                        ...product,
                        'selected': true,
                        'qty': 1,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Successfully Added To Cart'),
                          action: SnackBarAction(
                            label: 'Check',
                            textColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              context.go('/shopping');
                            },
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      color: Theme.of(context).primaryColor,
                      Icons.add_shopping_cart,
                      size: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
