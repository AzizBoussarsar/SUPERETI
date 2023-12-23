import 'package:flutter/material.dart';
import 'login_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Simulate a loading delay
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the login page
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'paths/supereti1.png',
            width: 400.0,
            height: 200.0,
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Your Business: Our Expertise',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
}