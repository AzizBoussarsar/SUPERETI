import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import 'clients.dart';



class ClientDetailsPage extends StatelessWidget {
  const ClientDetailsPage({Key? key, required Client client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
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
                Color.fromARGB(
                    97, 194, 100, 00), // Your existing dark green color
                Color.fromARGB(
                    0, 71, 3, 80), // A slightly lighter shade of green
              ],
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfileInfo(),
            const SizedBox(height: 16.0),
            _buildDeadlineText(),
            const SizedBox(height: 16.0),
            _buildTransactionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
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
          const CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage('paths/client1.png'),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'John Doe',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  
                  _buildContactItem(Icons.phone, '+1 123 456 7890'),
                  const SizedBox(width: 8.0),
                  _buildContactItem(Icons.email, 'johndoe@example.com'),
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
            'Mohsne doit rembourser demain sa dette de 200 \$',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
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
                  color: Colors.black),
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
          Text(transaction.deadline, style: const TextStyle(color: Colors.black)),
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

  Transaction(
      {required this.id,
      required this.date,
      required this.payment,
      required this.deadline});
}
