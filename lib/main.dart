// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:rescuetrack/screens/loginpage.dart';
import 'package:rescuetrack/screens/homepage.dart';
import 'package:rescuetrack/screens/maps.dart';
import 'package:rescuetrack/screens/profilepage.dart';
import 'package:rescuetrack/screens/irpage.dart';
import 'package:rescuetrack/screens/arpage.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const GetMaterialApp(
      home: Homepage(),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const Maps(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.black87,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'maps',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
        );
        }
        }
  

