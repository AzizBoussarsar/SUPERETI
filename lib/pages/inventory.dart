import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/transparent_curved_bottom_navbar.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Inventory',
        leadingOnPressed: () {
          // Action du bouton de retourA
        },
      ),
      backgroundColor: Colors.white,
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            List<Item> items = snapshot.data!.docs.map((doc) {
              final data = doc.data()!;
              return Item(
                name: data['name_pr'],
                price: data['price'].toDouble(),
                quantity: data['quantity'],
                image: 'your_image_path', // Replace with the actual image path
                category: data['category'],
                photoUrl: data['photoUrl'], // Added the photoUrl attribute
              );
            }).toList();

            return ListView.builder(
              itemCount: getUniqueCategories(items).length,
              itemBuilder: (context, index) {
                final category = getUniqueCategories(items)[index];
                final categoryItems =
                    items.where((item) => item.category == category).toList();

                return Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 6, 57, 5),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        height: 190,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryItems.length,
                          itemBuilder: (context, index) {
                            final item = categoryItems[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Card(
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x4dfcf5ed),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  width: 150,
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 5),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.network(
                                          item.photoUrl, // Use the photoUrl attribute
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        'Price: \$${item.price.toStringAsFixed(2)}',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      Text(
                                        'Quantity: ${item.quantity}',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      SizedBox(height: 4.0),
                                      _getItemStatus(item.quantity),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }

  List<String> getUniqueCategories(List<Item> items) {
    return items.map((item) => item.category).toSet().toList();
  }

  Widget _getItemStatus(int quantity) {
    Color statusColor;
    String statusText;

    if (quantity <= 0) {
      statusColor = Colors.red;
      statusText = 'Out of Stock';
    } else if (quantity <= 3) {
      statusColor = Colors.orange;
      statusText = 'Running Low';
    } else {
      statusColor = Colors.green;
      statusText = 'In Stock';
    }

    return Text(
      statusText,
      style: TextStyle(fontSize: 16.0, color: statusColor),
    );
  }
}

class Item {
  final String name;
  final double price;
  final int quantity;
  final String image;
  final String category;
  final String photoUrl; // Added the photoUrl attribute

  Item({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.category,
    required this.photoUrl,
  });
}