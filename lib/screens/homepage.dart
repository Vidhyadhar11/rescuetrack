// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescuetrack/screens/arpage.dart';
import 'package:rescuetrack/screens/chatpage.dart';
import 'package:rescuetrack/screens/irpage.dart';
import 'package:rescuetrack/screens/loginpage.dart';

class CardData {
  final String imagePath;
  final String label;

  CardData({required this.imagePath, required this.label});

  static List<CardData> cardDataList = [
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224446.png',
        label: 'SDRF1'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224458.png',
        label: 'SDRF2'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224508.png',
        label: 'SDRF3'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224524.png',
        label: 'SDRF4'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224532.png',
        label: 'SDRF5'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224539.png',
        label: 'SDRF6'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224546.png',
        label: 'SDRF7'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224554.png',
        label: 'SDRF8'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224629.png',
        label: 'SDRF9'),
    CardData(
        imagePath: 'assets/images/Screenshot 2023-09-14 224638.png',
        label: 'SDRF10'),
  ];
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact other teams"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black87,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/images/Screenshot 2023-09-14 224446.png"),
              ),
            ),
            ListTile(
              title: const Text("Login here"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginpage()),
                );
              },
            ),
            ListTile(
              title: const Text("Agency Registration"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const arpage()),
                );
              },
            ),
            ListTile(
              title: const Text("Individual Registration"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const irpage()),
                );
              },
            ),
            ListTile(
              title: const Text("Help"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const irpage()),
                );
              },
            ),
            ListTile(
              title: const Text("Contact Support"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const irpage()),
                );
              },
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const irpage()),
                );
              },
            ),
            ListTile(
              title: const Text("Logout"),
              onTap: () {
                // Implement logout functionality
              },
            ),
          ],
        ),
      ),
      body: buildGridView(context),
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: CardData.cardDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCard(context, CardData.cardDataList[index]);
      },
    );
  }

  Widget buildCard(BuildContext context, CardData cardData) {
    return Card(
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                cardData: cardData,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                cardData.imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 10.0),
              child: Text(
                cardData.label,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
