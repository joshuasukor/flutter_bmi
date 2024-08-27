import 'package:bmi/class/result_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double result = 0.0;
  String weight = '';
  String height = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController _weight = TextEditingController(text: weight);
    TextEditingController _height = TextEditingController(text: height);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _weight,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Weight (kg)'),
                border: OutlineInputBorder(),
                hintText: 'Please enter weight in kg',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _height,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Height (m)'),
                border: OutlineInputBorder(),
                hintText: 'Please enter height in meter',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.deepPurple,
                      ),
                    ),
                    onPressed: () {
                      // print('weight : ${_weight.text}');
                      // print('height : ${_height.text}');

                      double w = double.parse(_weight.text);
                      double h = double.parse(_height.text);

                      final bmi = w / (h * h);

                      setState(() {
                        result = bmi;
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultView(
                              result: result,
                            ),
                          ));
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _weight.clear();
                      _height.clear();
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.yellow,
                      ),
                    ),
                    onPressed: () async {
                      final Uri _url = Uri.parse('https://flutter.dev');

                      if (!await launchUrl(_url)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                    child: const Text(
                      'URL',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
