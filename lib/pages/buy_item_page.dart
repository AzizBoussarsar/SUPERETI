// widgets/buy_item_page.dart
import 'package:flutter/material.dart';

class BuyItemPage extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String imageUrl;

  BuyItemPage({
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
  });

  @override
  _BuyItemPageState createState() => _BuyItemPageState();
}

class _BuyItemPageState extends State<BuyItemPage> {
  int quantity = 1;
  String fournisseurName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF011D47),
        title: Center(child: Text("Buy Item",
        style:TextStyle(color: Color(0xFFf5f5f4)))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Price: ${widget.productPrice}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Fournisseur Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                setState(() {
                  fournisseurName = value;
                });
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.red,
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 28),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${(double.parse(widget.productPrice.replaceAll(RegExp(r'[^\d.]'), '')) * quantity).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle confirm button
                    // You can use the values like fournisseurName, widget.productName, etc.
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}
