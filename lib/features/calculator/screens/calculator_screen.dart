import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  String _equation = '';
  bool _shouldResetDisplay = false;

  void _onNumberPressed(String number) {
    setState(() {
      if (_display == '0' || _shouldResetDisplay) {
        _display = number;
        _shouldResetDisplay = false;
      } else {
        _display += number;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      _equation = _display + operator;
      _shouldResetDisplay = true;
    });
  }

  void _onEqualsPressed() {
    setState(() {
      if (_equation.isEmpty || _shouldResetDisplay) return;

      final expression = _equation + _display;
      try {
        final result = eval(expression);
        _display = result.toString();
        _equation = '';
      } catch (e) {
        _display = 'Error';
      }
      _shouldResetDisplay = true;
    });
  }

  void _onClearPressed() {
    setState(() {
      _display = '0';
      _equation = '';
      _shouldResetDisplay = false;
    });
  }

  double eval(String expression) {
    // Simple evaluation for basic operations
    // In a real app, use a proper expression parser
    final parts = expression.split(RegExp(r'[+\-*/]'));
    final operator = expression.substring(parts[0].length, parts[0].length + 1);
    final num1 = double.parse(parts[0]);
    final num2 = double.parse(parts[1]);

    switch (operator) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        return num1 / num2;
      default:
        throw Exception('Invalid operator');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _equation,
                    style: const TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _display,
                    style: const TextStyle(fontSize: 48),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CalculatorButton(
                        text: 'C',
                        onPressed: _onClearPressed,
                        backgroundColor: AppColors.error,
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '/',
                        onPressed: () => _onOperatorPressed('/'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CalculatorButton(
                        text: '7',
                        onPressed: () => _onNumberPressed('7'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '8',
                        onPressed: () => _onNumberPressed('8'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '9',
                        onPressed: () => _onNumberPressed('9'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '*',
                        onPressed: () => _onOperatorPressed('*'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CalculatorButton(
                        text: '4',
                        onPressed: () => _onNumberPressed('4'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '5',
                        onPressed: () => _onNumberPressed('5'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '6',
                        onPressed: () => _onNumberPressed('6'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '-',
                        onPressed: () => _onOperatorPressed('-'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CalculatorButton(
                        text: '1',
                        onPressed: () => _onNumberPressed('1'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '2',
                        onPressed: () => _onNumberPressed('2'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '3',
                        onPressed: () => _onNumberPressed('3'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '+',
                        onPressed: () => _onOperatorPressed('+'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CalculatorButton(
                        text: '0',
                        onPressed: () => _onNumberPressed('0'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '.',
                        onPressed: () => _onNumberPressed('.'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CalculatorButton(
                        text: '=',
                        onPressed: _onEqualsPressed,
                        backgroundColor: AppColors.primary,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}