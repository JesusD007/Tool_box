import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tool_box/presentation/Screens/gender_screen.dart';
import 'package:tool_box/presentation/Screens/main_screen.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.cyan),
            accountName: Text(
              "Jesús Domingo Rodriguez M.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "jesusd.jr45@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: Icon(
              Icons.person,
              size: 75,
              color: CupertinoColors.lightBackgroundGray,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScren()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.female,
            ),
            title: const Text('Gender Predictor'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GenderPredictor()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.schedule,
            ),
            title: const Text('Age Predictor'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.school,
            ),
            title: const Text('University Search'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.cloud,
            ),
            title: const Text('Weather'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.language,
            ),
            title: const Text('Web Page Viwer'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
            ),
            title: const Text('About Me'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
