import 'package:flutter/material.dart';



class CreateClientPage extends StatefulWidget {
  @override
  _CreateClientPageState createState() => _CreateClientPageState();
}

class _CreateClientPageState extends State<CreateClientPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un Nouveau Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProfileImageField(),
              SizedBox(height: 16.0),
              _buildTextField('Prénom', _firstNameController, (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prénom.';
                }
                return null;
              }),
              SizedBox(height: 16.0),
              _buildTextField('Nom', _lastNameController, (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom.';
                }
                return null;
              }),
              SizedBox(height: 16.0),
              _buildDateOfBirthField(),
              SizedBox(height: 16.0),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageField() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(
              'https://placekitten.com/100/100'), // Remplacez l'URL par l'image souhaitée
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {
            // Ajoutez votre logique de sélection de photo ici
          },
          child: Text('Sélectionner une Photo'),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      String? Function(String?)? validator) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }

  Widget _buildDateOfBirthField() {
    return TextFormField(
      controller: _dobController,
      decoration: InputDecoration(
        labelText: 'Date de Naissance',
        hintText: 'JJ/MM/AAAA',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer votre date de naissance.';
        }
        // Ajoutez des validations supplémentaires pour la date de naissance si nécessaire
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // Ajoutez votre logique pour traiter les données du formulaire ici
          // Enregistrez le nouveau profil, envoyez les données au serveur, etc.
          // Pour cet exemple, affichons simplement les informations dans la console
          print('Prénom: ${_firstNameController.text}');
          print('Nom: ${_lastNameController.text}');
          print('Date de Naissance: ${_dobController.text}');
        }
      },
      child: Text('Créer le Profil'),
    );
  }
}
