import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/transparent_curved_bottom_navbar.dart';
import 'product_card.dart';
import 'buy_item_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Operations',
        leadingOnPressed: () {
          // Action du bouton de retour
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(97, 194, 100, 00),
              Color.fromARGB(0, 71, 3, 80),
            ],
          ),
        ),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('produits').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            List<Product> products = snapshot.data!.docs
                .map((DocumentSnapshot<Map<String, dynamic>> doc) {
              Map<String, dynamic> data = doc.data()!;
              return Product(
                name: data['name_pr'] ?? 'No Name',
                price: data['price']?.toString() ?? '0.0',
                imageUrl: data['photoUrl'],
              );
            }).toList();

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Select the item you want to buy:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: (products.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      int firstProductIndex = index * 2;
                      int secondProductIndex = firstProductIndex + 1;

                      return Row(
                        children: [
                          if (firstProductIndex < products.length)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  String productName = products[firstProductIndex].name;
                                  String productPrice = products[firstProductIndex].price;
                                  String imageUrl = products[firstProductIndex].imageUrl;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BuyItemPage(
                                        productName: productName,
                                        productPrice: productPrice,
                                        imageUrl: imageUrl,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 16.0,
                                    bottom: 16.0,
                                  ),
                                  child: ProductCard(
                                    name: products[firstProductIndex].name,
                                    price: products[firstProductIndex].price,
                                    imageUrl: products[firstProductIndex].imageUrl,
                                  ),
                                ),
                              ),
                            ),
                          if (secondProductIndex < products.length)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  String productName = products[secondProductIndex].name;
                                  String productPrice = products[secondProductIndex].price;
                                  String imageUrl = products[secondProductIndex].imageUrl;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BuyItemPage(
                                        productName: productName,
                                        productPrice: productPrice,
                                        imageUrl: imageUrl,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 16.0,
                                    bottom: 16.0,
                                  ),
                                  child: ProductCard(
                                    name: products[secondProductIndex].name,
                                    price: products[secondProductIndex].price,
                                    imageUrl: products[secondProductIndex].imageUrl,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}