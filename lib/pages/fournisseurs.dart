import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/transparent_curved_bottom_navbar.dart';
import 'fournisseur_details.dart';
import 'create_fournisseur.dart';
import 'package:faker/faker.dart';

class Fournisseur {
  final String name;
  final String photoUrl;

  Fournisseur({required this.name, required this.photoUrl});
}

class FournisseursPage extends StatelessWidget {
  FournisseursPage({Key? key}) : super(key: key);

  static final faker = Faker();

  final List<Fournisseur> fournisseurs = List.generate(
    20,
    (index) => Fournisseur(
      name: faker.person.name(),
      photoUrl: 'paths/client1.png',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Suppliers',
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
            itemCount: fournisseurs.length,
            itemBuilder: (context, index) {
              final fournisseur = fournisseurs[index];
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
                                  backgroundImage: AssetImage(fournisseur.photoUrl),
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
                                    fournisseur.name,
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
                                          navigateToDetailsPage(context, fournisseur);
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
            navigateToCreateFournisseurPage(context);
          },
          child: const Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 210, 142, 94),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }

  void navigateToDetailsPage(BuildContext context, Fournisseur fournisseur) {
    // Navigate to the details page using Navigator.push
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FournisseurDetailsPage(fournisseur: fournisseur),
      ),
    );
  }

  void navigateToCreateFournisseurPage(BuildContext context) {
    // Navigate to the create client page using Navigator.push
    // Replace `CreateClientPage` with the appropriate page for creating a client
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateFournisseurPage(),
      ),
    );
  }
}

