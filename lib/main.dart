import 'package:calculadora_prova1/view/calculator_visor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const CalculatorMainPage(),
    );
  }
}
