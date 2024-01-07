import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/transparent_curved_bottom_navbar.dart';
import 'product_card.dart';
import 'buy_item_page.dart';
// Import the BuyItemPage

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Buy Products',
        leadingOnPressed: () {
          Navigator.pushReplacementNamed(context, '/buysell');
          // Action du bouton de retour
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
                Color.fromARGB(
                    0, 71, 3, 80), // A slightly lighter shade of green
              ],
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0), // Ajout de padding top
                        child: Text(
                          "Select the item you want to buy:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff8c6a31)),
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Replace these values with actual product details
                  String productName = "Product 1";
                  String productPrice = "\$20";
                  String imageUrl = "paths/im.png";

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
                      left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductCard(
                          name: "Product 1",
                          price: "\$20",
                          imageUrl: "paths/im.png",
                        ),
                      ),
                      SizedBox(
                          width:
                              16.0), // Ajout d'un espace de 16.0 entre les produits
                      Expanded(
                        child: ProductCard(
                          name: "Product 2",
                          price: "\$30",
                          imageUrl: "paths/im.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ProductCard(
                        name: "Product 3",
                        price: "\$40",
                        imageUrl: "paths/im.png",
                      ),
                    ),
                    SizedBox(
                        width:
                            16.0), // Ajout d'un espace de 16.0 entre les produits
                    Expanded(
                      child: ProductCard(
                        name: "Product 4",
                        price: "\$50",
                        imageUrl: "paths/im.png",
                      ),
                    ),
                  ],
                ),
              ),
              // Ajoutez plus de lignes au besoin
            ],
          )),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }
}