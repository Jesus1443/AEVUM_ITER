import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    this.showBackButton = true,
    this.showTitle = true,
    this.onBack,
  });

  final bool showBackButton;
  final bool showTitle;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
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
              ),
            ),

          if (!showBackButton)
            const SizedBox(width: 12),

          if (showTitle)
            const Text(
              'Aevum Iter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryDark,
              ),
            ),
        ],
      ),
    );
  }
}