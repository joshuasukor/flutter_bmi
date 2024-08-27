import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, this.result = 0.0});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text('Result'),
      ),
      body: Center(
          child: Text(
        result.toStringAsFixed(2),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      )),
    );
  }
}
