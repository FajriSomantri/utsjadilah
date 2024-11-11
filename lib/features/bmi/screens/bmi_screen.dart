import 'package:flutter/material.dart';
import '../widgets/height_slider.dart';
import '../widgets/weight_selector.dart';
import '../../../shared/widgets/custom_button.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double _height = 170;
  double _weight = 70;

  void _calculateBMI() {
    final heightInMeters = _height / 100;
    final bmi = _weight / (heightInMeters * heightInMeters);
    
    String category;
    if (bmi < 18.5) {
      category = 'Underweight';
    } else if (bmi < 25) {
      category = 'Normal';
    } else if (bmi < 30) {
      category = 'Overweight';
    } else {
      category = 'Obese';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your BMI Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              bmi.toStringAsFixed(1),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              category,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(fontSize: 20),
                    ),
                    HeightSlider(
                      value: _height,
                      onChanged: (value) => setState(() => _height = value),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Weight',
                      style: TextStyle(fontSize: 20),
                    ),
                    WeightSelector(
                      weight: _weight,
                      onChanged: (value) => setState(() => _weight = value),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Calculate BMI',
              onPressed: _calculateBMI,
            ),
          ],
        ),
      ),
    );
  }
}