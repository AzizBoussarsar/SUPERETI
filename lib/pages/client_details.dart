import 'package:flutter/material.dart';
import '../widgets/appbar.dart'; // Import the CustomAppBar widget
import 'clients.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientDetailsPage extends StatelessWidget {
  const ClientDetailsPage({Key? key, required this.client}) : super(key: key);

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // Assuming you have a CustomAppBar widget
        title: 'Client Details',
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(97, 194, 100, 00),
              Color.fromARGB(0, 71, 3, 80),
            ],
          ),
        ),
        child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('clients')
              .where('name', isEqualTo: client.name)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            // Check if there are no documents
            if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text('Client details not found'),
              );
            }

            // Access the first document in the QuerySnapshot
            DocumentSnapshot<Map<String, dynamic>> clientDocument =
                snapshot.data!.docs.first;
            Map<String, dynamic> clientData = clientDocument.data()!;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProfileInfo(clientData),
                const SizedBox(height: 16.0),
                _buildDeadlineText(),
                const SizedBox(height: 16.0),
                _buildTransactionsList(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileInfo(Map<String, dynamic> clientData) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0x5d857c6d),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(clientData['photoUrl']),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clientData['name'],
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _buildContactItem(Icons.phone, clientData['phone']),
                  const SizedBox(width: 8.0),
                  _buildContactItem(Icons.email, clientData['email']),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDeadlineText() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0x5d857c6d),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Le client doit rembourser demain sa dette de 200 \$',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Dernière chance de payer !',
            style: TextStyle(fontSize: 16.0, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    List<Transaction> transactions = [
      Transaction(
          id: 'T001', date: '2023-01-10', payment: 50, deadline: '2023-02-01'),
      Transaction(
          id: 'T002', date: '2023-02-15', payment: 75, deadline: '2023-03-10'),
      Transaction(
          id: 'T003', date: '2023-03-22', payment: 100, deadline: '2023-04-15'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Color(0x5d857c6d),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Transactions',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          _buildTransactionHeader(),
          ...transactions
              .map((transaction) => _buildTransactionItem(transaction))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildTransactionHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('ID',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text('Date',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text('Paiement',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text('Deadline',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(transaction.id, style: const TextStyle(color: Colors.black)),
          Text(transaction.date, style: const TextStyle(color: Colors.black)),
          Text('${transaction.payment}\$',
              style: const TextStyle(color: Colors.black)),
          Text(transaction.deadline,
              style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

class Transaction {
  final String id;
  final String date;
  final double payment;
  final String deadline;

  Transaction({
    required this.id,
    required this.date,
    required this.payment,
    required this.deadline,
  });
}