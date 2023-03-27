import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Text('home page'),
    Text('Category page'),
    Text('shopping cart page'),
    Text('personal page'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          _pages.elementAt(_currentIndex),
          ElevatedButton(
            onPressed: () {
              context.go('/category');
            },
            child: const Text('Tap on it to category page'),
          ),
        ]),
      ),
    );
  }
}
