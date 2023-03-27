// about page
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('back to home page'),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
    );
  }
}
