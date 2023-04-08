import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

void main() => runApp(BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BMICalculatorPage()),
            );
          },
          child: Text('Start Calculation Now'),
        ),
      ),
    );
  }
}