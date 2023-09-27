import 'package:flutter/material.dart';
import 'package:rescuetrack/screens/arpage.dart';
import 'package:rescuetrack/screens/irpage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const arpage()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Agency Registration"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const irpage()),
              );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Individual Registration"),
            ),
          ],
        ),
      ),
    );
  }
}
