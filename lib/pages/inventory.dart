import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';

import '../../widgets/transparent_curved_bottom_navbar.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(
        name: 'Item 1',
        price: 10.99,
        quantity: 5,
        image: 'paths/warda_coquilettes.png',
        category: 'Category A'),
    Item(
        name: 'Item 2',
        price: 15.99,
        quantity: 3,
        image: 'paths/warda_coquilettes.png',
        category: 'Category A'),
    Item(
        name: 'Item 3',
        price: 8.99,
        quantity: 8,
        image: 'paths/warda_coquilettes.png',
        category: 'Category B'),
    Item(
        name: 'Item 4',
        price: 15.99,
        quantity: 3,
        image: 'paths/warda_coquilettes.png',
        category: 'Category A'),
    Item(
        name: 'Item 5',
        price: 8.99,
        quantity: 8,
        image: 'paths/warda_coquilettes.png',
        category: 'Category A'),
    Item(
        name: 'Item 6',
        price: 12.99,
        quantity: 2,
        image: 'paths/warda_coquilettes.png',
        category: 'Category C'),
    Item(
        name: 'Item 7',
        price: 9.99,
        quantity: 0,
        image: 'paths/warda_coquilettes.png',
        category: 'Category C'),
    Item(
        name: 'Item 8',
        price: 14.99,
        quantity: 4,
        image: 'paths/warda_coquilettes.png',
        category: 'Category B'),
  ];

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
                Color.fromARGB(
                    97, 194, 100, 00), // Your existing dark green color
                Color.fromARGB(
                    0, 71, 3, 80), // A slightly lighter shade of green
              ],
            ),
          ),
          child: ListView.builder(
            itemCount: getUniqueCategories().length,
            itemBuilder: (context, index) {
              final category = getUniqueCategories()[index];
              final categoryItems =
                  items.where((item) => item.category == category).toList();

              return Padding(
                padding: const EdgeInsets.fromLTRB(
                    8.0, 16.0, 8.0, 0), // Espacement autour de chaque catégorie
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
                    SizedBox(
                        height:
                            8.0), // Espacement entre le mot "Category" et la liste
                    SizedBox(
                      height: 190, // Hauteur des éléments
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
                                  color: Color(
                                      0x4dfcf5ed), // Couleur de fond du Container à l'intérieur de la carte
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                width: 150,
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 5),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.asset(
                                        item.image,
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
          )),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }

  List<String> getUniqueCategories() {
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

  Item({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.category,
  });
}

class _CustomNavBar extends StatefulWidget {
  const _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<_CustomNavBar> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/inventory');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/clients');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/operations');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF011D47), // Dark blue color
      unselectedItemColor: const Color(0xFFf5f5f4),
      selectedItemColor: const Color(0xFF61A3BA),
      showUnselectedLabels: false,
      showSelectedLabels: true,
      onTap: _onTabTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          label: 'Inventory',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Clients',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money_outlined),
          label: 'Operations',
        ),
      ],
    );
  }
}
