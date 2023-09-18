// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:rescuetrack/screens/homescreen.dart';
import 'package:rescuetrack/screens/maps.dart';
import 'package:rescuetrack/screens/profilepage.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rescuetrack/screens/homescreen.dart';
// import 'package:rescuetrack/screens/loginpage.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         themeMode: ThemeMode.light,
//         theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//           fontFamily: GoogleFonts.lato().fontFamily,
//         ),
//         darkTheme: ThemeData(
//           brightness: Brightness.dark,
//         ),
//         routes: {
//           "/": (context) => const Loginpage(),
//           "/home": (context) => const Homepage(),
//           "/login": (context) => const Loginpage(),
//         });
//   }
// }

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
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.lightBlueAccent,
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

void main() => runApp(const MyApp());
