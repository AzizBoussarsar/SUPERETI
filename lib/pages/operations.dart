// main.dart
import 'package:flutter/material.dart';
import '../widgets/transparent_curved_bottom_navbar.dart';
import 'product_card.dart';
import 'buy_item_page.dart'; // Import the BuyItemPage


class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Operations",
        style:TextStyle(color: Color(0xFFf5f5f4)))),
        backgroundColor: const Color(0xFF011D47), 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFf5f5f4)),
          onPressed: () {
            // Handle back button pressed
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Color(0xFFf5f5f4)),
            onPressed: () {
              // Handle cart button pressed
              Navigator.pushReplacementNamed(context, '/shoppingcart');
            },
          ),
        ],
      ),
      body: Column(
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
          GestureDetector(
            onTap: () {
              // Replace these values with actual product details
              String productName = "Product 1";
              String productPrice = "\$20";
              String imageUrl =
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBoGjHq6C50q9eVyg4kCYFf2AgP3Xd8_w_YQ&usqp=CAU";

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
              child: const Row(
                children: [
                  Expanded(
                    child: ProductCard(
                      name: "Product 1",
                      price: "\$20",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBoGjHq6C50q9eVyg4kCYFf2AgP3Xd8_w_YQ&usqp=CAU",
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: ProductCard(
                      name: "Product 2",
                      price: "\$30",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBoGjHq6C50q9eVyg4kCYFf2AgP3Xd8_w_YQ&usqp=CAU",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
            child: const Row(
              children: [
                Expanded(
                  child: ProductCard(
                    name: "Product 3",
                    price: "\$40",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBoGjHq6C50q9eVyg4kCYFf2AgP3Xd8_w_YQ&usqp=CAU",
                  ),
                ),
                SizedBox(width: 2.0),
                Expanded(
                  child: ProductCard(
                    name: "Product 4",
                    price: "\$50",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBoGjHq6C50q9eVyg4kCYFf2AgP3Xd8_w_YQ&usqp=CAU",
                  ),
                ),
              ],
            ),
          ),
          // Add more rows as needed
        ],
      ),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }
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
