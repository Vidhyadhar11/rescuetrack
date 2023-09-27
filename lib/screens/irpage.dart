// this is individual registration page
// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const irpage());
}

class irpage extends StatefulWidget {
  const irpage({super.key});

  @override
  State<irpage> createState() => _irpageState();
}

class _irpageState extends State<irpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("individual registration"),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ProfileForm(),
          ),
        ),
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _expertiseController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _agencyController = TextEditingController();
  String _selectedVerificationProof = "";
  bool _acceptTerms = false;
  bool _enableLocationServices = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: const Color.fromARGB(221, 255, 255, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTextField("Name", _nameController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTextField("Role", _roleController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTextField("Contact Number", _contactController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTextField("Area of Expertise", _expertiseController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTextField("Technical Skills", _skillsController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTextField("Agency", _agencyController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
                value: _selectedVerificationProof.isNotEmpty ? _selectedVerificationProof : null,
              onChanged: (newValue) {
                setState(() {
                  _selectedVerificationProof = newValue!;
                });
              },
              hint: const Text("Select Verification Proof",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              items: ["", "ID Card", "Certificate", "Other"]
                  .map((proof) => DropdownMenuItem<String>(
                        value: proof,
                        child: Text(proof,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0))),
                      ))
                  .toList(),
              dropdownColor: Colors.grey,              
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
                checkColor: Colors.black,
                activeColor: Colors.orange,
              ),
              const Text("I accept the terms and conditions",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: _enableLocationServices,
                onChanged: (value) {
                  setState(() {
                    _enableLocationServices = value!;
                  });
                },
                checkColor: Colors.black,
                activeColor: Colors.orange,
              ),
              const Text("Enable location services",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle registration logic here
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
    );
  }
}
