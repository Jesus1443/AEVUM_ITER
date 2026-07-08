import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_duration.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/path_node.dart';
import '../../domain/enums/node_status.dart';

class PathNodeCard extends StatelessWidget {
  const PathNodeCard({
    required this.node,
    super.key,
    this.onTap,
  });

  final PathNode node;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isAvailable = node.status == NodeStatus.available;
    final isCompleted = node.status == NodeStatus.completed;

    Color backgroundColor;
    Color borderColor;
    Widget topIcon;

    switch (node.status) {
      case NodeStatus.completed:
        backgroundColor = AppColors.primary;
        borderColor = AppColors.primary;
        topIcon = const Icon(
          Icons.check_circle,
          color: AppColors.primary,
          size: 24,
        );
        break;

      case NodeStatus.available:
        backgroundColor = Colors.white;
        borderColor = AppColors.primary;
        topIcon = const Icon(
          Icons.play_circle_fill,
          color: AppColors.primary,
          size: 24,
        );
        break;

      case NodeStatus.locked:
        backgroundColor = Colors.grey.shade200;
        borderColor = Colors.grey.shade300;
        topIcon = const Icon(
          Icons.lock,
          color: Colors.grey,
          size: 24,
        );
        break;
    }

    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: AnimatedScale(
        duration: AppDuration.normal,
        curve: Curves.easeOutBack,
        scale: isAvailable ? 1 : 0.95,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topIcon,

            const SizedBox(height: AppSpacing.xs),

            AnimatedContainer(
              duration: AppDuration.normal,
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isAvailable
                        ? AppColors.primary.withValues(alpha: .18)
                        : Colors.black.withValues(alpha: .05),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Icon(
                node.icon,
                color: isCompleted
                    ? Colors.white
                    : isAvailable
                        ? AppColors.primary
                        : Colors.grey,
                size: 34,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            SizedBox(
              width: 90,
              child: Text(
                node.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isAvailable || isCompleted
                      ? AppColors.primaryDark
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}