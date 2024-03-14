import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tool_box/Data/Models/universities.dart';
import 'package:tool_box/presentation/Widgets/drawer.dart';

class UniversityScreen extends StatefulWidget {
  const UniversityScreen({super.key});

  @override
  State<UniversityScreen> createState() => _UniversityState();
}

class _UniversityState extends State<UniversityScreen> {
  List<Universities>? universities;
  TextEditingController tController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          'Universities Searcher',
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
              decoration: const InputDecoration(labelText: 'País a Buscar')),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              getUniversities();
            },
            child: const Text('Try to Predict'),
          ),
          const SizedBox(
            height: 25,
          ),
          const Divider(
            // Aquí agregamos el Divider
            color: Colors.black,
            thickness: 2.0,
          ),
          //aqui van los datos de la uni
          if (universities != null)
            for (var university in universities!)
              if (university.domains.isNotEmpty &&
                  university.webPages!.isNotEmpty)
                DataShower(
                  universityName: university.name,
                  universitydomain: university.domains[0],
                  universityurl: university.webPages![0],
                ),
        ]),
      ),
    );
  }

  Future<void> getUniversities() async {
    final response = await Dio().get(
        'http://universities.hipolabs.com/search?country=${tController.text}');
    setState(() {
      universities = universitiesFromJson(response.data);
    });
  }
}

class DataShower extends StatelessWidget {
  final String universityName;
  final String universitydomain;
  final String universityurl;

  const DataShower({
    super.key,
    required this.universityName,
    required this.universitydomain,
    required this.universityurl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(universityName,
            style: const TextStyle(
                fontFamily: AutofillHints.fullStreetAddress, fontSize: 25)),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Text('Dominio:',
                style: TextStyle(
                    fontFamily: AutofillHints.fullStreetAddress, fontSize: 18)),
            const SizedBox(
              width: 15,
            ),
            Text(universitydomain,
                style: const TextStyle(
                    fontFamily: AutofillHints.fullStreetAddress, fontSize: 18))
          ],
        ),
        Row(
          children: [
            const Text('Enlace:',
                style: TextStyle(
                    fontFamily: AutofillHints.fullStreetAddress, fontSize: 18)),
            const SizedBox(
              width: 30,
            ),
            Text(universityurl,
                style: const TextStyle(
                    fontFamily: AutofillHints.fullStreetAddress, fontSize: 18))
          ],
        ),
        const Divider(
          // Aquí agregamos el Divider
          color: Colors.black,
          thickness: 2.0,
        ),
      ],
    );
  }
}
