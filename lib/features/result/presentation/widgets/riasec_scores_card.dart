import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../test/domain/enums/riasec_dimension.dart';
import '../../domain/entities/riasec_scores.dart';

class RiasecScoresCard extends StatelessWidget {
  const RiasecScoresCard({
    required this.scores,
    super.key,
  });

  final RiasecScores scores;

  @override
  Widget build(BuildContext context) {
    final ranking = scores.sortedScores;

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
          const _SectionHeader(
            icon: Icons.bar_chart_rounded,
            title: 'TU PERFIL RIASEC',
          ),
          const SizedBox(height: AppSpacing.lg),
          for (var index = 0; index < ranking.length; index++) ...[
            _RiasecScoreRow(
              type: ranking[index].key,
              score: ranking[index].value,
              isDominant: index == 0,
            ),
            if (index < ranking.length - 1)
              const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    );
  }
}

class _RiasecScoreRow extends StatelessWidget {
  const _RiasecScoreRow({
    required this.type,
    required this.score,
    required this.isDominant,
  });

  final RiasecDimension type;
  final double score;
  final bool isDominant;

  @override
  Widget build(BuildContext context) {
    final normalizedScore = score.clamp(0, 100);
    final percentage = normalizedScore.round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                _nameOf(type),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isDominant
                      ? FontWeight.w900
                      : FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),
            Text(
              '$percentage%',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: isDominant
                    ? AppColors.primaryDark
                    : AppColors.textMuted,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.circular),
          child: LinearProgressIndicator(
            minHeight: 9,
            value: normalizedScore / 100,
            backgroundColor: AppColors.primary.withValues(alpha: 0.12),
            valueColor: AlwaysStoppedAnimation<Color>(
              isDominant
                  ? AppColors.primaryDark
                  : AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  String _nameOf(RiasecDimension type) {
    return switch (type) {
      RiasecDimension.realistic => 'Realista',
      RiasecDimension.investigative => 'Investigador',
      RiasecDimension.artistic => 'Artístico',
      RiasecDimension.social => 'Social',
      RiasecDimension.enterprising => 'Emprendedor',
      RiasecDimension.conventional => 'Convencional',
    };
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.16),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.bar_chart_rounded,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}