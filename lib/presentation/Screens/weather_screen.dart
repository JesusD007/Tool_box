import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tool_box/presentation/Widgets/drawer.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String weather = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'El clima en santo domingo es: $weather',
            style: TextStyle(
              fontFamily: AutofillHints.fullStreetAddress,
              fontSize: 40,
            ),
          )
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    setState(() {});

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=18.735693&lon=-70.162651&appid=febb21687a6b39ceca3afa8ecb085a14&units=metric&lang=es'));

    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          weather = data['weather'][0]['description'];
        });
      } catch (e) {
        print('Error decoding JSON: $e');
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
