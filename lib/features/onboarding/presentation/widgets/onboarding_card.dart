import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../domain/entities/onboarding_item.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.item,
  });

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.image,
            height: screenHeight * 0.34,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: AppSizes.xl),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}