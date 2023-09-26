// ignore_for_file: avoid_web_libraries_in_flutter, use_key_in_widget_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:rescuetrack/screens/chatpage.dart';

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

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact other teams"),
      ),
      body: buildGridView(context),
    );
  }

  Widget buildGridView(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 16,
      ),
      itemCount: CardData.cardDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCard(context, CardData.cardDataList[index]);
      },
    );
  }

  Widget buildCard(BuildContext context, CardData cardData) {
    return Card(
      elevation: 5,
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
              height: 110,
              width: 150,
              child: Image.asset(
                cardData.imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 11.0, 0, 6.0),
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
