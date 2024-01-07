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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('paths/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color:
                Colors.black.withOpacity(0.3), // Adjust the opacity as desired
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'paths/logofinal_text3.png',
                  width: 600.0,
                  height: 600.0,
                ),
                // SizedBox(height: 40.0),
                SpinKitPulse(
                  color: Color(0x5f000000), // Set the color of the dots
                  size: 120.0, // Set the size of the loading indicator
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
