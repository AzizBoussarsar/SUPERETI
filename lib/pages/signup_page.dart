import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signup() {
    // Perform signup logic here
    String fullName = _fullNameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String password = _passwordController.text;

    // For simplicity, just display a SnackBar with the entered credentials
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Full Name: $fullName, Email: $email, Phone: $phone, Password: $password'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define the color #E3E3E3 and #61A3BA
    Color boxColor = const Color(0xFFE3E3E3);
    Color signupButtonColor = const Color(0xFF61A3BA);
    Color linkColor = Colors.blue; // Set the link color to blue

    return Scaffold(
      appBar: AppBar(
        title: const Text(''), // Empty title
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8, // Adjusted height
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align to the top of the column
                children: [
                  // Styled Full Name Text Field with Shadow
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: boxColor, // Set the color to #E3E3E3
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12, // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: Offset(0, 3), // Shadow offset
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: InputBorder.none, // No border
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0), // Adjust padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Styled Valid Email Text Field with Shadow
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: boxColor, // Set the color to #E3E3E3
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12, // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: Offset(0, 3), // Shadow offset
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Valid Email',
                        border: InputBorder.none, // No border
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0), // Adjust padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Styled Phone Number Text Field with Shadow
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: boxColor, // Set the color to #E3E3E3
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12, // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: Offset(0, 3), // Shadow offset
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: InputBorder.none, // No border
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0), // Adjust padding
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Styled Strong Password Text Field with Shadow
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: boxColor, // Set the color to #E3E3E3
                      boxShadow: const [
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
                      decoration: const InputDecoration(
                        labelText: 'Strong Password',
                        border: InputBorder.none, // No border
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0), // Adjust padding
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 32.0), // Increased distance
                  // Signup Button with the same width and height as other input boxes
                  Container(
                    width: double.infinity,
                    height: 60.0, // Set the height as needed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color:
                          signupButtonColor, // Set the background color to #61A3BA
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12, // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: Offset(0, 3), // Shadow offset
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _signup,
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .transparent, // Set the button background color to transparent
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // "Already a member? Log In" Text with a small size
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member? ',
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the LoginPage when "Log In" is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text(
                          'Log In',
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
}
