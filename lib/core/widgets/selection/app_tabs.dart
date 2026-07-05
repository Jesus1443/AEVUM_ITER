import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../constants/app_duration.dart';
import '../../constants/app_radius.dart';
import '../../constants/app_spacing.dart';

typedef AppTabLabelBuilder<T> = String Function(T value);

class AppTabs<T> extends StatelessWidget {
  const AppTabs({
    required this.values,
    required this.selectedValue,
    required this.labelBuilder,
    required this.onChanged,
    super.key,
  });

  final List<T> values;
  final T selectedValue;
  final AppTabLabelBuilder<T> labelBuilder;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Row(
        children: values.map((value) {
          final bool selected = value == selectedValue;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(value),
              child: AnimatedContainer(
                duration: AppDuration.normal,
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Text(
                  labelBuilder(value),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? Colors.white
                        : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}