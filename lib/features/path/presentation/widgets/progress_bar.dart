import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.completedQuestions,
    super.key,
  });

  final int completedQuestions;

  @override
  Widget build(BuildContext context) {
    const totalQuestions = 30;
    final progress = completedQuestions / totalQuestions;
    final percentage = (progress * 100).round();

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -18,
            bottom: -28,
            child: Icon(
              Icons.rocket_launch_rounded,
              size: 120,
              color: Colors.grey.withValues(alpha: .15),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'PROGRESO ACTUAL',
                style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Tu viaje profesional\nestá despegando.',
                style: TextStyle(
                  fontSize: 28,
                  height: 1.15,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.circular),
                      child: LinearProgressIndicator(
                        minHeight: 10,
                        value: progress,
                        backgroundColor:
                            AppColors.primary.withValues(alpha: .16),
                        valueColor: const AlwaysStoppedAnimation(
                          AppColors.accent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Text(
                    '$percentage%',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Has completado $completedQuestions de 30 preguntas.',
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}