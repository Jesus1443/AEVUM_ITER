import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/path_node.dart';
import '../../domain/enums/node_status.dart';
import 'path_node_card.dart';

class PathTimeline extends StatelessWidget {
  const PathTimeline({
    required this.nodes,
    required this.completedQuestions,
    super.key,
  });

  final List<PathNode> nodes;
  final int completedQuestions;

  @override
  Widget build(BuildContext context) {
    final completedBlocks = completedQuestions ~/ 5;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        top: AppSpacing.xl,
        bottom: AppSpacing.xxl,
      ),
      itemCount: nodes.length,
      itemBuilder: (context, index) {
        final node = nodes[index].copyWith(
          status: _statusFor(index, completedBlocks),
        );

        final showConnector = index < nodes.length - 1;
        final connectorActive = index < completedBlocks;

        return Column(
          children: [
            PathNodeCard(node: node),
            if (showConnector)
              Container(
                width: 8,
                height: 72,
                margin: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: connectorActive
                      ? AppColors.accent
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
          ],
        );
      },
    );
  }

  NodeStatus _statusFor(int index, int completedBlocks) {
    if (index < completedBlocks) return NodeStatus.completed;
    if (index == completedBlocks) return NodeStatus.available;
    return NodeStatus.locked;
  }
}