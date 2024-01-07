import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'pages/fournisseurs.dart';

import 'pages/inventory.dart';
import '/pages/home.dart';
import 'pages/clients.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/operations.dart';
import 'pages/shopping_cart.dart';
import 'pages/buy_sell.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCsHDQtI9DItQgSqwy45_y2xG9tDGxuER8",
        appId: "1:540215271818:web:8b22d4aee01acdce862873",
        messagingSenderId: "540215271818",
        projectId: "flutter-firebase-9c136",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
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
        '/home': (context) => const BankApp(),
        '/inventory': (context) => InventoryPage(),
        '/clients': (context) => ClientsPage(),
        '/operations': (context) => ProductPage(),
        '/shoppingcart': (context) => ShoppingCart(),
        '/buysell': (context) => BuySellPage(),
        '/fournisseurs': (context) => FournisseursPage()
      },
    );
  }
}
