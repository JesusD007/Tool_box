import 'package:flutter/material.dart';

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
        body: Center(
          child: Container(
            child: Text('hola'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIdex,
          elevation: 0,
          onTap: (value) {
            setState(() {
              selectedIdex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'prueba',
                backgroundColor: Colors.cyan),
            BottomNavigationBarItem(
                icon: Icon(Icons.smart_display_outlined),
                activeIcon: Icon(Icons.smart_display),
                label: 'User',
                backgroundColor: Colors.cyan),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                activeIcon: Icon(Icons.info),
                label: 'prueba',
                backgroundColor: Colors.cyan),
          ],
        ));
  }
}
