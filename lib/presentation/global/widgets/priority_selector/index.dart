import 'package:esferasoft/app/themes/index.dart';
import 'package:flutter/material.dart';

class PrioritySelector extends StatelessWidget {
  const PrioritySelector({
    super.key,
    this.selectedValue,
    required this.onChange});

  final double? selectedValue;
  final Function(double value) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Slider(
        min: 0.0,
        max: 2.0,
        value: selectedValue ?? 0.0,
        activeColor: EMAppTheme.themeColors.success,
        thumbColor: EMAppTheme.themeColors.base,
        divisions: 2,
        onChanged: (value) => onChange.call(value),
      ),
    );
  }
}
