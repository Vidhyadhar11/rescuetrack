import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("catelog app"),
      ),
      body: Center(
        child: Container(child: (const Text("catelog app"))),
      ),
      drawer: const Drawer(),
    );
  }
}
