import 'dart:io'; // Import the dart:io library to work with files
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/appbar.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package

void main() {
  runApp(MaterialApp(
    home: CreateClientPage(),
  ));
}

class CreateClientPage extends StatefulWidget {
  @override
  _CreateClientPageState createState() => _CreateClientPageState();
}

class _CreateClientPageState extends State<CreateClientPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  bool _isChecked = false;

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();

  late ImagePicker _imagePicker;
  File? _imageFile; // Store the picked image file

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker(); // Initialize ImagePicker instance
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add a New Client',
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(68, 194, 100, 0),
              Color.fromARGB(0, 71, 3, 80),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                _buildProfileImageField(),
                SizedBox(height: 20.0),
                _buildTextField('Name', _nameController, _nameFocusNode, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name.';
                  }
                  return null;
                }),
                SizedBox(height: 20.0),
                _buildTextField('Email', _emailController, _emailFocusNode, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email.';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email.';
                  }
                  return null;
                }),
                SizedBox(height: 20.0),
                _buildTextField('Phone Number', _phoneController, _phoneFocusNode, (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number.';
                  }
                  return null;
                }),
                SizedBox(height: 12.0),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageField() {
    return Column(
      children: [
        _imageFile != null
            ? CircleAvatar(
                radius: 50.0,
                backgroundImage: FileImage(
                  // Display the selected image if available
                  _imageFile!,
                ),
              )
            : CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  'assets/default_image.png',
                ), // Replace with a default image if no image is selected
              ),
        SizedBox(height: 12.0),
        ElevatedButton(
          onPressed: () {
            _pickImage(); // Call the image picking function
          },
          child: Text('Select a Photo'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 176, 118, 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Convert XFile to File
      });
    }
  }

  Widget _buildTextField(String label, TextEditingController controller, FocusNode focusNode,
      String? Function(String?)? validator) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusNode.hasFocus ? const Color.fromARGB(255, 10, 66, 12) : Colors.black,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 8, 64, 9),
            width: 2.0,
          ),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          print('Name: ${_nameController.text}');
          print('Email: ${_emailController.text}');
          print('Phone Number: ${_phoneController.text}');

          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      child: Text('Add Client'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 176, 118, 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}