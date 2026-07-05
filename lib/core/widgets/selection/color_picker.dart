import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import 'color_option.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    required this.colors,
    required this.selectedColor,
    required this.onChanged,
    super.key,
  });

  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      children: colors.map((color) {
        return ColorOption(
          color: color,
          selected: color == selectedColor,
          onTap: () => onChanged(color),
        );
      }).toList(),
    );
  }
}