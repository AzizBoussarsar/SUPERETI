// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/transparent_curved_bottom_navbar.dart';

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
      extendBody: true,
      appBar: CustomAppBar(
        title: 'Clients Cart',
        leadingOnPressed: () {
          Navigator.pop(context);
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
              Color.fromARGB(0, 71, 3, 80), // A slightly lighter shade of green
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0.0, // Padding pour le haut
                  left: 20.0, // Padding pour la gauche
                  right: 20.0, // Padding pour la droite
                  bottom: 0.0, // Padding pour le bas
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(2.0),
                  itemCount: items.length,
                  itemExtent: 160.0,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 6.0),
                      decoration: BoxDecoration(
                        color: Color(0x5d857c6d),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16.0),
                            leading: SizedBox(
                              width: 80,
                              height: 202,
                              child: Image.asset(
                                items[index].image,
                                width: 80,
                                height: 200,
                              ),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                items[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0c3119),
                                ),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Text('Prix unitaire: \$${items[index].price}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff0c3119),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (items[index].quantity > 0) {
                                              items[index].quantity--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xcff6e6d7),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: Color(0xff292828),
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      '${items[index].quantity}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 20),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            items[index].quantity++;
                                          });
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Color(0xcff6e6d7),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Color(0xff2c2c2c),
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      'Prix total: \$${items[index].price * items[index].quantity}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff0c3119),
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Color(0xffdfdfdf),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -15),
                    blurRadius: 20,
                    color: const Color(0x679e9e9e),
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Center(
                              child: Icon(
                                  Icons
                                      .attach_money, // Icône de paiement (exemple : carte de crédit)
                                  size: 30, // Taille de l'icône
                                  color: Colors.orange)), // Couleur de l'icône

                          //icon
                        ),
                        const Spacer(),
                        const Text("Add voucher code",
                            style: TextStyle(color: Color(0xff112138))),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.orange,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Total:\n ${total.toStringAsFixed(2)} DT",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff112138),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(97, 194, 100, 00),
                                  Color(0xc9c26400)
                                ])),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(50.0, 55.0)),
                                    elevation: MaterialStateProperty.all(0),
                                    alignment: Alignment.center,
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.only(
                                            right: 55,
                                            left: 55,
                                            top: 15,
                                            bottom: 15)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CheckoutPage(totalAmount: total),
                                    ),
                                  );
                                },
                                child: Text(
                                  "checkout",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                )))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

class CheckoutPage extends StatefulWidget {
  final double totalAmount;

  CheckoutPage({required this.totalAmount});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _clientName = '';
  bool _isCashSelected = true; // Par défaut, Cash est sélectionné
  bool _isCreditSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Checkout',
          leadingOnPressed: () {
            Navigator.pop(context);
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
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Total à payer: ${widget.totalAmount.toStringAsFixed(2)} DT',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff112138)),
              ),
              SizedBox(height: 20),
              ElevatedTextField(
                onChanged: (value) {
                  setState(() {
                    _clientName = value;
                  });
                },
                labelText: 'Nom du client',
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mode de paiement', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  ElevatedCheckbox(
                    value: _isCashSelected,
                    onChanged: (value) {
                      setState(() {
                        _isCashSelected = value!;
                        _isCreditSelected = !_isCashSelected;
                      });
                    },
                    label: 'Cash',
                  ),
                  ElevatedCheckbox(
                    value: _isCreditSelected,
                    onChanged: (value) {
                      setState(() {
                        _isCreditSelected = value!;
                        _isCashSelected = !_isCreditSelected;
                      });
                    },
                    label: 'Credit',
                  ),
                  SizedBox(height: 20),
                  Center(
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              gradient: const LinearGradient(colors: [
                                Color(0x7cc26400),
                                Color(0xcfc26400)
                              ])),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(50.0, 55.0)),
                                  elevation: MaterialStateProperty.all(0),
                                  alignment: Alignment.center,
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(
                                          right: 55,
                                          left: 55,
                                          top: 15,
                                          bottom: 15)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  )),
                              onPressed: () {},
                              child: Text(
                                "Validate",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              )))),
                ],
              ),
            ]),
          )),
        ));
  }
}

class ElevatedTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String labelText;

  const ElevatedTextField({Key? key, this.onChanged, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: Color(0xffdfdfdf),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      style: TextStyle(fontSize: 18),
    );
  }
}

class ElevatedCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String label;

  const ElevatedCheckbox(
      {Key? key, required this.value, this.onChanged, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.orange;
              }
              return Colors.white;
            },
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
