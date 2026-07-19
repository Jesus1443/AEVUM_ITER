import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/riasec_profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.profile,
    super.key,
  });

  final RiasecProfile profile;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ProfileHeader(),
          const SizedBox(height: AppSpacing.lg),
          Text(
            profile.name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            profile.shortDescription,
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
              fontWeight: FontWeight.w700,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            profile.description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.6,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.person_search_rounded,
          color: AppColors.primaryDark,
        ),
        SizedBox(width: AppSpacing.sm),
        Text(
          'PERFIL PREDOMINANTE',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
            color: AppColors.primaryDark,
          ),
        ),
      ],
    );
  }
}