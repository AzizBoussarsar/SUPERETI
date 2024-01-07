// login_page.dart
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Adjust the duration as needed
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation when the page is loaded
    _controller.forward();
  }

  void _login() {
    // Perform login logic here
    String username = _usernameController.text;
    String password = _passwordController.text;
    // String rememberMeText = _rememberMe ? 'Yes' : 'No';

    // For simplicity, just display a SnackBar with the entered credentials
    bool isLoggedIn = username == 'Aziz' && password == 'Boussarsar';

    if (isLoggedIn) {
      // If login is successful, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BankApp()),
      );
    } else {
      // If login fails, display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password.'),
        ),
      );
    }
  }

@override
Widget build(BuildContext context) {
  // Define the color #E3E3E3 and #61A3BA
  Color boxColor = Color(0xFFfdfcdc);
  Color loginButtonColor = Color(0xFFd8d355);
  Color linkColor = Color.fromARGB(255, 235, 201, 153); // Set the link color to blue

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
          color: Colors.black.withOpacity(0.3), // Translucent layer color and opacity
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Align to the top of the column
              children: [
                // Center the logo horizontally
                SizedBox(
                  height: 50.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'paths/logofinal.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ), // Add space between the logo and the user name section
                // Styled Username Text Field with Shadow
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: boxColor, // Set the color to #E3E3E3
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12, // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 3), // Shadow offset
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: InputBorder.none, // No border
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0), // Adjust padding
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                // Styled Password Text Field with Shadow
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: boxColor, // Set the color to #E3E3E3
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12, // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 3), // Shadow offset
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: InputBorder.none, // No border
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0), // Adjust padding
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 16.0),
                // Remember Me Checkbox and Forgot Password Option in a Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        Text(
                          'Remember Me',
                          style:TextStyle(
                            color: boxColor,
                            fontWeight: FontWeight.bold
                          ), // Set the text co ,

                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement the "Forgot Password" logic
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: linkColor,
                            fontWeight: FontWeight.bold
                          ), // Set the text color to the link color
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                // Login Button with the same width and height as username and password boxes
                Container(
                  width: double.infinity,
                  height: 60.0, // Set the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: loginButtonColor, // Set the background color to #61A3BA
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12, // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 3), // Shadow offset
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .transparent, //Set the button background color to transparent
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                // "New Member? Register now" Text with a small size
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New Member? ',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the SignupPage when "Register now" is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: linkColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          
          ),
        ),
      ],
    ),
  );
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
