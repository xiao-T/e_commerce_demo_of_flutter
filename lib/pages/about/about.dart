// about page
import 'package:e_mall_demo/pages/about/base_info.dart';
import 'package:e_mall_demo/pages/about/header.dart';
import 'package:e_mall_demo/pages/about/skills.dart';
import 'package:e_mall_demo/utils.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      ),
      body: Column(
        children: const [
          Header(),
          SizedBox(
            height: 100.0,
          ),
          BaseInfo(),
          Skills(),
        ],
      ),
    );
  }
}
