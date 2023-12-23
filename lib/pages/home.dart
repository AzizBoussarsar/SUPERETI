import 'package:flutter/material.dart';
import '../widgets/transparent_curved_bottom_navbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF011D47),
          title: Center(child: Text("Home",
        style:TextStyle(color: Color(0xFFf5f5f4)))),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24.0),
        ),
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