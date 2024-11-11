import 'package:flutter/material.dart';
import '../../../core/constant/app_styles.dart';

class TemperatureInput extends StatelessWidget {
  final TextEditingController controller;
  final String unit;
  final ValueChanged<String> onUnitChanged;

  const TemperatureInput({
    super.key,
    required this.controller,
    required this.unit,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: AppStyles.inputDecoration.copyWith(
              labelText: 'Temperature',
            ),
          ),
        ),
        const SizedBox(width: 16),
        DropdownButton<String>(
          value: unit,
          items: ['Celsius', 'Fahrenheit', 'Kelvin']
              .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
              .toList(),
          onChanged: (value) {
            if (value != null) onUnitChanged(value);
          },
        ),
      ],
    );
  }
}