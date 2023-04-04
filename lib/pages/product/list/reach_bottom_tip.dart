// reach bottom tip

import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class ReachBottomTip extends StatelessWidget {
  ReachBottomTip({Key? key, required this.reachBottom}) : super(key: key);

  bool reachBottom;
  @override
  Widget build(BuildContext context) {
    if (!reachBottom) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(gap['l']!),
      child: const Text('No More Data'),
    );
  }
}
