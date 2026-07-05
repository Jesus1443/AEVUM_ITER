import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.currentIndex, required this.totalPages, super.key,
  });

  final int currentIndex;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = currentIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
              ? AppColors.primary
              : AppColors.primary.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}