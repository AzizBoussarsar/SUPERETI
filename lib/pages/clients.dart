import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/transparent_curved_bottom_navbar.dart';
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
      appBar: CustomAppBar(
        title: 'Clients',
        leadingOnPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
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
          child: ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: SizedBox(
                    height: 120,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60, // Réduction de la taille de l'image
                              height: 60, // Réduction de la taille de l'image
                              padding:
                                  EdgeInsets.all(2), // Ajustement de la bordure
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.grey,
                                    width:
                                        1), // Réduction de l'épaisseur de la bordure
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(client.photoUrl),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    20), // Espacement entre l'image et le texte
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height:
                                          4), // Fait descendre légèrement le texte
                                  Text(
                                    client.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16, // Taille de police ajustée
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                      height:
                                          6), // Ajuste l'espace sous le texte
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          navigateToDetailsPage(context, client);
                                        },
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.grey,
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
                  ),
                ),
              );
            },
          )),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
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
          backgroundColor: Color.fromARGB(255, 210, 142, 94),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }

  void navigateToDetailsPage(BuildContext context, Client client) {
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
