
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescuetrack/screens/homescreen.dart';
import 'package:rescuetrack/screens/loginpage.dart';
import 'package:rescuetrack/screens/maps.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: {
          "/": (context) => const Maps(),
          "/home": (context) => const Homepage(),
          "/login": (context) => const Loginpage(),
        });
  }
}
