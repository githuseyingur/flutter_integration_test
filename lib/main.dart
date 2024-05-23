import 'package:flutter/material.dart';
import 'package:integrationtest/auth_view.dart';
import 'package:integrationtest/cart_view.dart';
import 'package:integrationtest/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AuthPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
