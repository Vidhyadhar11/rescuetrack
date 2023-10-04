// ignore_for_file: camel_case_types, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescuetrack/main.dart';
import 'package:rescuetrack/screens/homepage.dart';


class arpage extends StatefulWidget {
  const arpage({Key? key}) : super(key: key);

  @override
  State<arpage> createState() => _arpageState();
}

class _arpageState extends State<arpage> {
  final TextEditingController _agencyNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _adminContactNumberController =
      TextEditingController();
  final TextEditingController _resources = TextEditingController();
  String _selectedAgencyType = "";
  String _selectedVerification = "";
  bool _acceptTerms = false;
  bool _locationPermission = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agency Registration"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextField("Agency Name", _agencyNameController),
            ),
            DropdownButton<String>(
              key: const Key('agencyTypeDropdown'),
              value: _selectedAgencyType.isNotEmpty
                  ? _selectedAgencyType
                  : null,
              onChanged: (newValue) {
                setState(() {
                  _selectedAgencyType = newValue!;
                });
              },
              hint: const Text("  Select Agency Type"),
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              items: [
                "  Select Agency Type",
                " Type 1",
                " Type 2",
                "  Type 3"
              ]
                  .map((type) => DropdownMenuItem<String>(
                        value: type,
                        child: Text(type,
                            style: const TextStyle(color: Colors.black)),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextField(
                  "Contact Number", _contactNumberController),
            ),
            DropdownButton<String>(
              value: _selectedVerification.isNotEmpty
                  ? _selectedVerification
                  : null,
              onChanged: (newValue) {
                setState(() {
                  _selectedVerification = newValue!;
                });
              },
              hint: const Text("  Upload Verification"),
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              items: [
                "  Upload Verification",
                "  Verification 1",
                "  Verification 2",
                "  Verification 3"
              ]
                  .map((verification) => DropdownMenuItem<String>(
                        value: verification,
                        child: Text(verification,
                            style: const TextStyle(color: Colors.black)),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextField(
                  "Admin Contact Number", _adminContactNumberController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTextField("Resources", _resources),
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
                const Text("Accept Terms and Conditions"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: _locationPermission,
                  onChanged: (value) {
                    setState(() {
                      _locationPermission = value!;
                    });
                  },
                  checkColor: Colors.black,
                  activeColor: Colors.orange,
                ),
                const Text("Enable Location Permissions"),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _validateData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black87,
              ),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }

  _validateData(){
    if(_agencyNameController.text.isNotEmpty && _contactNumberController.text.isNotEmpty){
 
       Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyApp()),
              );
              }
    else{
      Get.snackbar("REQUIRED", " All Fields Required ",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.shade50,
      icon: const Icon(Icons.warning_amber_rounded),
);
}}
}