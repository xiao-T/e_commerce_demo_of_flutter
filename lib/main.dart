import 'package:e_mall_demo/models/login.dart';
import 'package:e_mall_demo/models/shopping_cart.dart';
import 'package:e_mall_demo/models/user_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserInfoModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginModel(),
        ),
        ChangeNotifierProvider(create: (_) => ShoppingCartModel())
      ],
      child: MaterialApp.router(
        title: 'Flutter E-Mall Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          dialogTheme: const DialogTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          useMaterial3: true,
          indicatorColor: Colors.black,
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black38,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
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
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
        routerConfig: shellRoute,
      ),
    );
  }
}
