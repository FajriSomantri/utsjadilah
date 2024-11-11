import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
class WeightSelector extends StatelessWidget {
  final double weight;
  final ValueChanged<double> onChanged;

  const WeightSelector({
    super.key,
    required this.weight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () => onChanged(weight - 0.5),
          color: AppColors.primary,
          iconSize: 32,
        ),
        const SizedBox(width: 16),
        Text(
          '${weight.toStringAsFixed(1)} kg',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () => onChanged(weight + 0.5),
          color: AppColors.primary,
          iconSize: 32,
        ),
      ],
    );
  }
}