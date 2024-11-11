import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class HeightSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${value.round()} cm',
          style: const TextStyle(fontSize: 24),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            thumbColor: AppColors.primary,
            overlayColor: AppColors.primary.withOpacity(0.2),
          ),
          child: Slider(
            value: value,
            min: 120,
            max: 220,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}