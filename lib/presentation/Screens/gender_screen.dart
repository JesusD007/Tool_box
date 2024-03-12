import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tool_box/Data/Models/gender.dart';
import 'package:tool_box/presentation/Widgets/drawer.dart';

class GenderPredictor extends StatefulWidget {
  const GenderPredictor({super.key});

  @override
  State<GenderPredictor> createState() => _GenderPredictState();
}

class _GenderPredictState extends State<GenderPredictor> {
  Gender? gender;
  TextEditingController gController = TextEditingController();

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
        child: Column(children: [
          TextField(
              controller: gController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Nombre')),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              getGender();
            },
            child: const Text('Try to Predict'),
          ),
          const SizedBox(
            height: 25,
          ),
          // Text(gender?.gender ?? ''),
          if (gender != null)
            Image.asset(
              gender!.gender == 'male'
                  ? 'assets/m-symbol.png'
                  : gender!.gender == 'female'
                      ? 'assets/w-symbol.webp'
                      : 'assets/white_background.jpg',
              width: 300,
            )
        ]),
      ),
    );
  }

  Future<void> getGender() async {
    final response =
        await Dio().get('https://api.genderize.io/?name=${gController.text}');
    setState(() {
      gender = Gender.fromJson(response.data);
    });
  }
}
