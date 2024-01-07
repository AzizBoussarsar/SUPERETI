import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl; // Chemin de l'image locale

  const ProductCard({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 8, // Élévation de la carte
      shadowColor: Color(0xff3b3a3a), // Couleur d'ombre blanche
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 8),
                child: Image.network(
                  imageUrl,
            width: 100, // Set an appropriate width
            height: 100, // Set an appropriate height
            fit: BoxFit.cover, // Adjust the BoxFit property as needed
              )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center, // Centrer le texte
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: $price TND',
                    textAlign: TextAlign.center, // Centrer le texte
                    style: TextStyle(fontSize: 14, color: Color(0xff065f0d)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}