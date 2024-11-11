import 'package:flutter/material.dart';
import '../widgets/currency_input.dart';
import '../../../shared/widgets/custom_button.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  String _result = '';

  final List<String> _currencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'AUD',
    'CAD',
    'CHF',
    'CNY',
    'IDR',
  ];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _convertCurrency() async {
    // Implement currency conversion logic here
    // In a real app, you would use an API
    if (_amountController.text.isEmpty) return;

    try {
      final amount = double.parse(_amountController.text);
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _result = '${amount.toStringAsFixed(2)} $_fromCurrency = '
            '${(amount * 1.2).toStringAsFixed(2)} $_toCurrency';
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
        title: const Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CurrencyInput(
              controller: _amountController,
              currency: _fromCurrency,
              currencies: _currencies,
              onCurrencyChanged: (value) => setState(() => _fromCurrency = value),
            ),
            const SizedBox(height: 16),
            const Text('to', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _toCurrency,
              isExpanded: true,
              items: _currencies
                  .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _toCurrency = value);
                }
              },
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Convert',
              onPressed: _convertCurrency,
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