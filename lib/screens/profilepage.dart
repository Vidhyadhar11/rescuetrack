// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User Profile"),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black87,
        ),
        body: const UserProfile(),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _roleController = TextEditingController();
    final TextEditingController _contactController = TextEditingController();
    final TextEditingController _expertiseController = TextEditingController();
    final TextEditingController _skillsController = TextEditingController();
    final TextEditingController _agencyController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
            child: Center(
              child: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/images/Screenshot 2023-09-14 224446.png"),
                radius: 40.0,
              ),
            ),
          ),
    
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              _buildTextField("Name", _nameController),
              _buildTextField("Role", _roleController),
              _buildTextField("Contact Number", _contactController),
              _buildTextField("Area of Expertise", _expertiseController),
              _buildTextField("Technical Skills", _skillsController),
              _buildTextField("Agency", _agencyController),
            ],
          ),
    
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.email),
                      onPressed: () {
                        // Implement email support functionality
                      },
                    ),
                    const Text("Contact Support"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.help),
                      onPressed: () {
                        // Implement help functionality
                      },
                    ),
                    const Text("Help"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
