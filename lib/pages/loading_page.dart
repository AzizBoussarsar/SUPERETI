import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the login page
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff489dbd), Color(0xff0d8cbd)],
            stops: [0.25, 0.75],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 30.0),
              // Image.asset(
              //   'paths/suplogo1.png',
              //   width: 150.0,
              //   height: 150.0,
              // ),
              SizedBox(height: 50.0),
              // Center(
              //   child: Text(
              //     'Your Business: Our Expertise',
              //     style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF023047)),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              Image.asset(
                'paths/SUPSUP.png',
                width: 300.0,
                height: 300.0,
              ),
              SizedBox(height: 50.0),
              SpinKitPulse(
                color: Color(0xff8ecae6), // Set the color of the dots
                size: 120.0, // Set the size of the loading indicator
              ),
            ],
          ),
        ),
      ),
    );
  }
}