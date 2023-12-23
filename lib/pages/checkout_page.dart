import 'package:flutter/material.dart';


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
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total à payer: \$${widget.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _clientName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Nom du client',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mode de paiement', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: _isCashSelected,
                        onChanged: (value) {
                          setState(() {
                            _isCashSelected = value!;
                            _isCreditSelected = !_isCashSelected;
                          });
                        },
                      ),
                      Text('Cash'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isCreditSelected,
                        onChanged: (value) {
                          setState(() {
                            _isCreditSelected = value!;
                            _isCashSelected = !_isCreditSelected;
                          });
                        },
                      ),
                      Text('Credit'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Effectuer des actions lors de la validation du formulaire
                  print('Client: $_clientName');
                  print('Cash selected: $_isCashSelected');
                  print('Credit selected: $_isCreditSelected');
                  print(
                      'Total à payer: ${widget.totalAmount.toStringAsFixed(2)}');
                },
                child: Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}