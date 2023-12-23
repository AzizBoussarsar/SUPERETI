import 'package:flutter/material.dart';
import '../widgets/transparent_curved_bottom_navbar.dart';
import 'client_details.dart';
import 'create_client.dart';
import 'package:faker/faker.dart';

class Client {
  final String name;
  final String photoUrl;

  Client({required this.name, required this.photoUrl});
}

class ClientsPage extends StatelessWidget {
  ClientsPage({Key? key}) : super(key: key);

  static final faker = Faker();

  final List<Client> clients = List.generate(
    20,
    (index) => Client(
      name: faker.person.name(),
      photoUrl: 'paths/client1.png',
    ),
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF011D47),
          title: Center(child: Text("Clients",
        style:TextStyle(color: Color(0xFFf5f5f4)))),
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          final client = clients[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(client.photoUrl),
              ),
              title: Text(client.name),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Handle details link tap
                navigateToDetailsPage(context, client);;
              },
            ),
          );
        },
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Handle create client button tap
            navigateToCreateClientPage(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }

  void navigateToDetailsPage(BuildContext context ,Client client) {
    // Navigate to the details page using Navigator.push
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClientDetailsPage(client: client),
      ),
    );
  }

  void navigateToCreateClientPage(BuildContext context) {
  // Navigate to the create client page using Navigator.push
  // Replace `CreateClientPage` with the appropriate page for creating a client
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CreateClientPage(),
    ),
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
      unselectedItemColor:  const Color(0xFFf5f5f4),
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