import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/widgets/appbar.dart';

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
      extendBody: true,
      appBar: CustomAppBar(
        title: 'Buy Item',
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(
                  97, 194, 100, 00), // Your existing dark green color
              Color.fromARGB(0, 71, 3, 80), // A slightly lighter shade of green
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Card(
                  color: Colors.grey[200],
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            child: Center(
                              child: Image.network(
                                widget.imageUrl,
                                height: 90,
                                width: 70,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      widget.productName,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Center(
                                    child: Text(
                                      'Price: ${widget.productPrice} TND',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff09510a),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Fournisseur Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    fournisseurName = value;
                  });
                },
              ),
              SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        child:
                            Icon(Icons.remove, size: 20, color: Colors.white),
                        backgroundColor: Color(0xffe39b83),
                        mini: true,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '$quantity',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Icon(Icons.add, size: 20, color: Colors.white),
                        backgroundColor: Color(0xffe39b83),
                        mini: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:\n ${(double.parse(widget.productPrice.replaceAll(RegExp(r'[^\d.]'), '')) * quantity).toStringAsFixed(2)} TND',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(97, 194, 100, 00),
                              Color(0xc9c26400),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            int oldQuantity = await FirebaseFirestore.instance
                                .collection('produits')
                                .where('name_pr', isEqualTo: widget.productName)
                                .get()
                                .then((value) {
                              return value.docs.isNotEmpty
                                  ? value.docs.first['quantity'] ?? 0
                                  : 0;
                            });

                            int newQuantity = oldQuantity + quantity;

                            await FirebaseFirestore.instance
                                .collection('produits')
                                .where('name_pr', isEqualTo: widget.productName)
                                .get()
                                .then((querySnapshot) {
                              querySnapshot.docs.forEach((doc) {
                                doc.reference.update({'quantity': newQuantity});
                              });
                            });

                            // Handle other confirm actions if needed
                            Navigator.pushReplacementNamed(context, '/inventory');
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(100, 60)),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}