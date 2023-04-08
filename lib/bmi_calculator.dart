import 'package:flutter/material.dart';

class BMICalculator {
  double calculateBMI(double weight, double height) {
    double bmi = weight / ((height / 100) * (height / 100));
    return bmi;
  }

  String getBMICriteria(double bmi) {
    if (bmi >= 30.0) {
      return 'Very Obese';
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      return 'Obese';
    } else if (bmi >= 18.6 && bmi <= 24.9) {
      return 'Normal Weight';
    } else if (bmi >= 16.0 && bmi <= 18.5) {
      return 'Underweight';
    } else if (bmi < 16.0) {
      return 'Severely Underweight';
    } else {
      return '';
    }
  }
}class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  double _bmi = 0.0;
  BMICalculator _calculator = BMICalculator();

  void _calculateBMI() {
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    double height = double.tryParse(_heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      setState(() {
        _bmi = _calculator.calculateBMI(weight, height);
      });
    } else {
      setState(() {
        _bmi = 0.0;
      });
    }
  }
  String _getBMICriteria() {
    return _calculator.getBMICriteria(_bmi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate'),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'BMI: ${_bmi.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Criteria: ${_getBMICriteria()}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}