import 'package:flutter/material.dart';
import 'package:tool_box/config/theme/app_theme.dart';
import 'package:tool_box/presentation/Screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const MainScren(),
    );
  }
}
