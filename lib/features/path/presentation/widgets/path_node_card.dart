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

    final color = isLocked ? Colors.grey.shade300 : AppColors.accent;
    final iconColor = isLocked ? Colors.grey : Colors.white;

    final statusText = isCompleted
        ? 'COMPLETADO'
        : isAvailable
            ? 'EN CURSO'
            : 'BLOQUEADO';

    return Row(
      children: [
        Container(
          width: 94,
          height: 94,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              color: isLocked
                  ? Colors.grey.shade200
                  : AppColors.accent.withValues(alpha: .30),
              width: 6,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isAvailable ? .16 : .08),
                blurRadius: isAvailable ? 18 : 8,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            isCompleted ? Icons.check_rounded : node.icon,
            color: iconColor,
            size: 36,
          ),
        ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                node.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: isLocked ? Colors.grey : AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: isLocked
                      ? Colors.grey.shade200
                      : AppColors.accent.withValues(alpha: .90),
                  borderRadius: BorderRadius.circular(AppRadius.circular),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w900,
                    color: isLocked ? Colors.grey : AppColors.primaryDark,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                node.description,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}