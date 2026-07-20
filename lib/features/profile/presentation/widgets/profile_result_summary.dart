import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/user_profile.dart';

/// Tarjeta que resume el resultado vocacional guardado en el perfil.
class ProfileResultSummary extends StatelessWidget {
  const ProfileResultSummary({
    required this.profile,
    super.key,
  });

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final hasResult = profile.hollandCode != null &&
        profile.dominantDimension != null &&
        profile.recommendedCareer != null &&
        profile.compatibility != null;

    if (!hasResult) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: const Column(
          children: [
            Icon(
              Icons.psychology_alt_outlined,
              size: 48,
              color: AppColors.primary,
            ),
            SizedBox(height: AppSpacing.md),
            Text(
              'Aún no hay un resultado vocacional guardado.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'PERFIL VOCACIONAL ACTUAL',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _ResultRow(
            icon: Icons.badge_outlined,
            label: 'Código Holland',
            value: profile.hollandCode!,
          ),
          const SizedBox(height: AppSpacing.md),
          _ResultRow(
            icon: Icons.stars_outlined,
            label: 'Perfil dominante',
            value: profile.dominantDimension!,
          ),
          const SizedBox(height: AppSpacing.md),
          _ResultRow(
            icon: Icons.school_outlined,
            label: 'Carrera recomendada',
            value: profile.recommendedCareer!,
          ),
          const SizedBox(height: AppSpacing.md),
          _ResultRow(
            icon: Icons.percent_rounded,
            label: 'Compatibilidad',
            value: '${profile.compatibility!.round()} %',
          ),
        ],
      ),
    );
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
