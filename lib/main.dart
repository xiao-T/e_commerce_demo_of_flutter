import 'package:flutter/material.dart';

import './routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter E-Mall Demo',
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.deepOrange,
        indicatorColor: Colors.black,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black38,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            height: 1.4,
            fontSize: 14,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            height: 1.4,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
      routerConfig: shellRoute,
    );
  }
}
