import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';

class TestProgressHeader extends StatelessWidget {
  const TestProgressHeader({
    required this.currentQuestion,
    required this.totalQuestions,
    super.key,
  });

  final int currentQuestion;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    final progress = currentQuestion / totalQuestions;

    return Column(
      children: [
        const AppTopBar(),

        const SizedBox(height: AppSpacing.xl),

        Row(
          children: [
            const Text(
              'PROGRESO VOCACIONAL',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Text(
              '$currentQuestion DE $totalQuestions',
              style: const TextStyle(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
                fontSize: 15,
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.circular),
          child: LinearProgressIndicator(
            minHeight: 12,
            value: progress,
            backgroundColor: AppColors.primary.withValues(alpha: .12),
            valueColor: const AlwaysStoppedAnimation(
              AppColors.accent,
            ),
          ),
        ),
      ],
    );
  }
}