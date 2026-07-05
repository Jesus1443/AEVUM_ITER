import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../constants/app_duration.dart';
import '../constants/app_radius.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    required this.value, super.key,
  });

  /// Valor entre 0 y 1
  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.circular),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: value),
        duration: AppDuration.normal,
        builder: (context, value, child) {
          return LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: AppColors.primary.withValues(alpha: .15),
            valueColor: const AlwaysStoppedAnimation(
              AppColors.primary,
            ),
          );
        },
      ),
    );
  }
}