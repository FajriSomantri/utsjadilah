import 'package:flutter/material.dart';
import '../widgets/temperature_input.dart';
import '../../../shared/widgets/custom_button.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final _temperatureController = TextEditingController();
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  String _result = '';

  @override
  void dispose() {
    _temperatureController.dispose();
    super.dispose();
  }

  void _convertTemperature() {
    if (_temperatureController.text.isEmpty) return;

    try {
      final temperature = double.parse(_temperatureController.text);
      double convertedTemperature;

      if (_fromUnit == _toUnit) {
        convertedTemperature = temperature;
      } else if (_fromUnit == 'Celsius') {
        if (_toUnit == 'Fahrenheit') {
          convertedTemperature = (temperature * 9 / 5) + 32;
        } else {
          convertedTemperature = temperature + 273.15;
        }
      } else if (_fromUnit == 'Fahrenheit') {
        if (_toUnit == 'Celsius') {
          convertedTemperature = (temperature - 32) * 5 / 9;
        } else {
          convertedTemperature = (temperature - 32) * 5 / 9 + 273.15;
        }
      } else {
        if (_toUnit == 'Celsius') {
          convertedTemperature = temperature - 273.15;
        } else {
          convertedTemperature = (temperature - 273.15) * 9 / 5 + 32;
        }
      }

      setState(() {
        _result = '${temperature.toStringAsFixed(2)} $_fromUnit = '
            '${convertedTemperature.toStringAsFixed(2)} $_toUnit';
      });
    } catch (e) {
      setState(() {
        _result = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TemperatureInput(
              controller: _temperatureController,
              unit: _fromUnit,
              onUnitChanged: (value) => setState(() => _fromUnit = value),
            ),
            const SizedBox(height: 16),
            const Text('to', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _toUnit,
              isExpanded: true,
              items: ['Celsius', 'Fahrenheit', 'Kelvin']
                  .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _toUnit = value);
                }
              },
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Convert',
              onPressed: _convertTemperature,
            ),
            const SizedBox(height: 24),
            Text(
              _result,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}