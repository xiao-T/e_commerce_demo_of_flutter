// product list
import 'package:e_mall_demo/models/product_list.dart';
import 'package:e_mall_demo/pages/product/list/Items.dart';
import 'package:e_mall_demo/pages/product/list/head_filter.dart';
import 'package:e_mall_demo/pages/product/list/reach_bottom_tip.dart';
import 'package:e_mall_demo/pages/product/list/side_filter.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key, this.listId}) : super(key: key);

  String? listId;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _reachBottom = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void updateReachBottomStatus(bool newStatus) {
    setState(() {
      _reachBottom = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return ChangeNotifierProvider(
      create: (_) => ProductListModel(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: [
            Container(),
          ],
          title: Text('Product List: ${widget.listId}'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: gap['m']!,
                horizontal: gap['l']!,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: gap['m']!,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadFilter(),
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: const Text('More'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Items(
                onReachBottom: updateReachBottomStatus,
              ),
            ),
            ReachBottomTip(reachBottom: _reachBottom),
            SizedBox(
              height: bottomPadding,
            ),
          ],
        ),
        endDrawer: const SideFilter(),
      ),
    );
  }
}
