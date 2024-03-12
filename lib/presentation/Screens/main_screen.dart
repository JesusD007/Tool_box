import 'package:flutter/material.dart';
import 'package:tool_box/presentation/Widgets/drawer.dart';

class MainScren extends StatefulWidget {
  const MainScren({super.key});

  @override
  State<MainScren> createState() => _MainScrenState();
}

class _MainScrenState extends State<MainScren> {
  int selectedIdex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/toolbox.webp',
            width: 250,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Bienvenido a Tool Box !!!',
            style: TextStyle(
              fontFamily: AutofillHints.fullStreetAddress,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      )),
    );
  }
}
