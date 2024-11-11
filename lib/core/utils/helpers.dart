import 'package:flutter/material.dart';

class Helpers {
  static void showSnackBar(BuildContext context, String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  static String formatNumber(double number, {int decimals = 2}) {
    return number.toStringAsFixed(decimals);
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static bool isNumeric(String? str) {
    if (str == null) return false;
    return double.tryParse(str) != null;
  }
}