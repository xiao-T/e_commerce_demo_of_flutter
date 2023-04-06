import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../common/slider_container.dart';

import 'hot_words.dart';
import 'iconic.dart';
import 'new_arrival.dart';
import 'top_sale.dart';
import 'hot_share.dart';
import 'carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollDirection _direction = ScrollDirection.idle;
  final ScrollController _scrollController = ScrollController();

  void _handleScroll() {
    setState(() {
      _direction = _scrollController.position.userScrollDirection;
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SliderContainer(
        direction: _direction,
        child: AppBar(
          title: const Text('Home'),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
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
      ),
    );
  }
}
