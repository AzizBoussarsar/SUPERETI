import 'package:flutter/material.dart';
import 'pages/inventory.dart';
import 'pages/home.dart';
import 'pages/clients.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/operations.dart';
import 'pages/shopping_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MyHomePage(),
        '/inventory': (context) => InventoryPage(),
        '/clients': (context) => ClientsPage(),
        '/operations': (context) => ProductPage(),
        '/shoppingcart': (context) => ShoppingCart(),
      },
    );
  }
}
