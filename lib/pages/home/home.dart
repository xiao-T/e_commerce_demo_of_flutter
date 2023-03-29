import 'package:flutter/material.dart';

import 'hot_words.dart';
import 'iconic.dart';
import 'new_arrival.dart';
import 'top_sale.dart';
import 'hot_share.dart';
import 'carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          Carousel(),
          const Divider(
            height: 2.0,
          ),
          Iconic(),
          const NewArrival(),
          HotWords(),
          const TopSale(),
          HotShare(),
        ],
      ),
    );
  }
}
