import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/path_node.dart';
import '../../domain/enums/node_status.dart';

class PathNodeCard extends StatelessWidget {
  const PathNodeCard({
    required this.node,
    super.key,
  });

  final PathNode node;

  @override
  Widget build(BuildContext context) {
    final isAvailable = node.status == NodeStatus.available;
    final isCompleted = node.status == NodeStatus.completed;
    final isLocked = node.status == NodeStatus.locked;

    final circleColor = isLocked ? Colors.grey.shade200 : AppColors.accent;
    final iconColor = isLocked ? Colors.grey : Colors.white;

    final statusText = isCompleted
        ? 'COMPLETADO'
        : isAvailable
            ? 'EN CURSO'
            : 'BLOQUEADO';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 78,
          height: 78,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
            border: Border.all(
              color: isLocked
                  ? Colors.grey.shade300
                  : AppColors.accent.withValues(alpha: .25),
              width: 6,
            ),
            boxShadow: [
              BoxShadow(
                color: isAvailable
                    ? AppColors.accent.withValues(alpha: .35)
                    : Colors.black.withValues(alpha: .08),
                blurRadius: isAvailable ? 24 : 10,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            isCompleted ? Icons.check_rounded : node.icon,
            color: iconColor,
            size: 32,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          node.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: isLocked ? Colors.grey : AppColors.textDark,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: isLocked
                ? Colors.grey.shade200
                : AppColors.accent.withValues(alpha: .95),
            borderRadius: BorderRadius.circular(AppRadius.circular),
          ),
          child: Text(
            statusText,
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w900,
              color: isLocked ? Colors.grey : AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}