import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/riasec_scores.dart';
import 'riasec_radar_chart.dart';

class RiasecRadarCard extends StatelessWidget {
  const RiasecRadarCard({
    required this.scores,
    super.key,
  });

  final RiasecScores scores;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Icon(
                Icons.radar_rounded,
                color: AppColors.primaryDark,
              ),
              SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'MAPA DE TU PERFIL',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: AppColors.primaryDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'La forma del gráfico representa el nivel de afinidad que '
            'obtuviste en cada dimensión RIASEC.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availableWidth = constraints.maxWidth;
                final chartSize = availableWidth.clamp(
                  240.0,
                  330.0,
                );

                return RiasecRadarChart(
                  scores: scores,
                  size: chartSize,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}