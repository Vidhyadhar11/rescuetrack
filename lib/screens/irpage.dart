// this is individual registration page
// ignore_for_file: camel_case_types, library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescuetrack/main.dart';
import 'package:rescuetrack/screens/homepage.dart';


class irpage extends StatefulWidget {
  const irpage({super.key});

  @override
  State<irpage> createState() => _irpageState();
}

class _irpageState extends State<irpage> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("individual registration"),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black87,
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
              value: _selectedVerificationProof.isNotEmpty
                  ? _selectedVerificationProof
                  : null,
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
              _validateDate(_nameController, _roleController);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.black87,
            ),
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }

  void _validateDate(TextEditingController nameController,
      TextEditingController roleController) {
    if (nameController.text.isNotEmpty && roleController.text.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyApp()));
    } else {
      Get.snackbar(
        "REQUIRED",
        "All Fields Required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.shade50,
        icon: const Icon(Icons.warning_amber_rounded),
      );
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 3, 3, 3)),
        ),
      ),
    );
  }
}
