import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tool_box/Data/Models/age.dart';
import 'package:tool_box/presentation/Widgets/drawer.dart';

class AgePredictor extends StatefulWidget {
  const AgePredictor({super.key});

  @override
  State<AgePredictor> createState() => _AgePredictState();
}

class _AgePredictState extends State<AgePredictor> {
  Age? age;
  bool execution = false;
  TextEditingController tController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          'Age Predictor',
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
              controller: tController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Nombre')),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              getAge();
            },
            child: const Text('Try to Predict'),
          ),
          const SizedBox(
            height: 25,
          ),
          // Text(gender?.gender ?? ''),
          if (age?.age != null)
            Text('Edad: ${age!.age}',
                style: const TextStyle(
                  fontFamily: AutofillHints.fullStreetAddress,
                  fontSize: 20,
                )),
          if (age?.age != null)
            Image.asset(
              age!.age! <= 18
                  ? 'assets/young-man.jpg'
                  : age!.age! <= 45
                      ? 'assets/adult-man.avif'
                      : 'assets/old-man.jpg',
              width: 300,
            ),
          if (age?.age == null && execution == true)
            Image.asset(
              'assets/white_background.jpg',
              width: 300,
            )
        ]),
      ),
    );
  }

  Future<void> getAge() async {
    final response =
        await Dio().get('https://api.agify.io/?name=${tController.text}');
    setState(() {
      age = Age.fromJson(response.data);
      execution = true;
    });
  }
}
