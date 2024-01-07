import 'package:flutter/material.dart';


class BuySellPage extends StatefulWidget {
   @override
  _BuySellPageState createState() => _BuySellPageState();
}

class _BuySellPageState extends State<BuySellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 8,
          title: const Text("Checkout", style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffeba06a),
                  Color(0xffdc5a10)
                ], // Couleurs du dégradé
                begin: Alignment.topLeft, // Position de départ du dégradé
                end: Alignment.bottomRight, // Position d'arrivée du dégradé
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.share,
                color: Color(0xffffffff),
              ),
              onPressed: () {},
            )
          ],
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xffffffff),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/operations');
              },
              child: Text('Buy'),
            ),
            SizedBox(height: 16), // Add some spacing between the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/shoppingcart');
              },
              child: Text('Sell'),
            ),
          ],
        ),
      ),
    );
  }
}