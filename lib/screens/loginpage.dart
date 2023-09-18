// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:rescuetrack/screens/homescreen.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(180, 255, 255, 255),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(237, 236, 236, 0.511),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  // border: Border(bottom: BorderSide(strokeAlign: BorderSide.strokeAlignInside))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter email",
                          labelText: "Email",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context,'/home');
                      },
                      style: TextButton.styleFrom(),
                      child: const Text("    Login    "),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
