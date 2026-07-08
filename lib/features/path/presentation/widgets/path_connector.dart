import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';

class PathConnector extends StatelessWidget {
  const PathConnector({
    required this.isActive,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 42,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(AppRadius.circular),
      ),
    );
  }
}