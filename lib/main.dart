import 'package:flutter/material.dart';
import 'package:integrationtest/auth_view.dart';
import 'package:integrationtest/cart_view.dart';
import 'package:integrationtest/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
