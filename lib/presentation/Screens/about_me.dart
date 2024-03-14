import 'package:flutter/material.dart';
import 'package:tool_box/presentation/Widgets/drawer.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  int selectedIdex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          'About Me',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/my-foto.JPG',
              width: 300,
              height: 475,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            const Text(
              'Jesús Domingo Rodríguez M.',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                decorationColor: Color.fromARGB(250, 0, 0, 0),
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Contacto',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Center(
                child: Text(
                  'Matricula: 20220067\nTelefono: (849)-351-8007\nCorreo: 20220067@itla.edu.do',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
