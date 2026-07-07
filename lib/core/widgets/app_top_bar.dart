import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    this.showBackButton = true,
    this.onBack,
  });

  final bool showBackButton;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showBackButton)
          IconButton(
            onPressed: onBack ??
                () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryDark,
              size: 22,
            ),
          )
        else
          const SizedBox(width: 48),
        const SizedBox(width: 4),
        const Text(
          'Aevum Iter',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
            color: AppColors.primaryDark,
          ),
        ),
      ],
    );
  }
}