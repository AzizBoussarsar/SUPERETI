import 'package:flutter/material.dart';
import '../widgets/transparent_curved_bottom_navbar.dart';
import 'checkout_page.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Item> items = [
    Item(
      name: 'Produit 1',
      quantity: 0,
      price: 10,
      image: 'paths/warda_coquilettes.png', // Chemin vers l'image
    ),
    Item(
      name: 'Produit 2',
      quantity: 0,
      price: 20,
      image: 'paths/warda_coquilettes.png', // Chemin vers l'image
    ),
    Item(
      name: 'Produit 3',
      quantity: 0,
      price: 20,
      image: 'paths/warda_coquilettes.png', // Chemin vers l'image
    ),
    Item(
      name: 'Produit 4',
      quantity: 0,
      price: 20,
      image: 'paths/warda_coquilettes.png', // Chemin vers l'image
    ),
    Item(
      name: 'Produit 5',
      quantity: 0,
      price: 20,
      image: 'paths/warda_coquilettes.png', // Chemin vers l'image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double total = 0; // Variable pour stocker le total des prix

    // Calcul du total des prix
    for (var item in items) {
      total += item.price * item.quantity;
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      items[index].image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      items[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Prix unitaire: \$${items[index].price}',
                              style: TextStyle(fontSize: 14),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (items[index].quantity > 0) {
                                    items[index].quantity--;
                                  }
                                });
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                ),
                                child: Center(
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '${items[index].quantity}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  items[index].quantity++;
                                });
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(),
                                ),
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Prix total: \$${items[index].price * items[index].quantity}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(totalAmount: total),
                      ),
                    );
                  },
                  child: Text('Checkout', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }
}

class Item {
  final String name;
  int quantity;
  final double price;
  final String image;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });
}
