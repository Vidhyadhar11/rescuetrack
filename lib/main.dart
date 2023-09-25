// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:rescuetrack/screens/homescreen.dart';
import 'package:rescuetrack/screens/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
    
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
      initialRoute: '/home',
      routes: {
    '/login': (context) => const Loginpage(),
    '/home': (context) => const Homepage(),
  },
      
    );
  }
}

void main() => runApp(const MyApp());
