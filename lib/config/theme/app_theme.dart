import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.cyan,
        appBarTheme: const AppBarTheme(elevation: 20),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      );
}
