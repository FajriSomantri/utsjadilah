import 'package:flutter/material.dart';
import '../../../core/constant/app_styles.dart';

class CurrencyInput extends StatelessWidget {
  final TextEditingController controller;
  final String currency;
  final List<String> currencies;
  final ValueChanged<String> onCurrencyChanged;

  const CurrencyInput({
    super.key,
    required this.controller,
    required this.currency,
    required this.currencies,
    required this.onCurrencyChanged,
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
              labelText: 'Amount',
            ),
          ),
        ),
        const SizedBox(width: 16),
        DropdownButton<String>(
          value: currency,
          items: currencies
              .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
              .toList(),
          onChanged: (value) {
            if (value != null) onCurrencyChanged(value);
          },
        ),
      ],
    );
  }
}