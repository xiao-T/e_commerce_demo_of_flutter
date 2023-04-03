// product detail page
import 'package:e_mall_demo/pages/product/bottom_action_bar.dart';
import 'package:e_mall_demo/pages/product/product_base_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './carousel.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key, required this.id}) : super(key: key);

  String? id = '';

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late String? _id;
  late String _size;

  @override
  void initState() {
    setState(() {
      _id = widget.id;
      _size = 'x';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Product Id ${widget.id}',
          style: const TextStyle(color: Colors.black87),
        ),
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () => {context.pop()},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Carousel(),
                  ProductBaseInfo(
                      id: _id,
                      updateSize: (size) {
                        setState(() {
                          _size = size;
                        });
                      }),
                ],
              ),
            ),
          ),
          BottomActionBar(
            id: _id,
            size: _size,
          ),
        ],
      ),
    );
  }
}
