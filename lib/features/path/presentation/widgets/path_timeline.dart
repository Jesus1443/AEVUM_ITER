import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/path_node.dart';
import 'path_node_card.dart';

class PathTimeline extends StatelessWidget {
  const PathTimeline({
    required this.nodes,
    super.key,
  });

  final List<PathNode> nodes;

  static const double _nodeSize = 145;
  static const double _verticalGap = 175;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = (nodes.length - 1) * _verticalGap + _nodeSize;

        final positions = _buildPositions(
          width: width,
          count: nodes.length,
        );

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: AppSpacing.lg,
            bottom: AppSpacing.xxxl,
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _PathTimelinePainter(
                      positions: positions,
                    ),
                  ),
                ),
                for (var i = 0; i < nodes.length; i++)
                  Positioned(
                    left: positions[i].dx - (_nodeSize / 2),
                    top: positions[i].dy - (_nodeSize / 2),
                    width: _nodeSize,
                    height: _nodeSize,
                    child: Center(
                      child: PathNodeCard(
                        node: nodes[i],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Offset> _buildPositions({
    required double width,
    required int count,
  }) {
    final centerX = width / 2;
    final leftX = width * 0.28;
    final rightX = width * 0.72;

    return List.generate(count, (index) {
      final y = (_nodeSize / 2) + (index * _verticalGap);

      final x = switch (index % 3) {
        0 => centerX,
        1 => leftX,
        _ => rightX,
      };

      return Offset(x, y);
    });
  }
}

class _PathTimelinePainter extends CustomPainter {
  const _PathTimelinePainter({
    required this.positions,
  });

  final List<Offset> positions;

  @override
  void paint(Canvas canvas, Size size) {
    if (positions.length < 2) return;

    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < positions.length - 1; i++) {
      final start = positions[i];
      final end = positions[i + 1];

      final path = Path()
        ..moveTo(start.dx, start.dy + 45);

      final controlY = (start.dy + end.dy) / 2;

      path.cubicTo(
        start.dx,
        controlY,
        end.dx,
        controlY,
        end.dx,
        end.dy - 45,
      );

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _PathTimelinePainter oldDelegate) {
    return oldDelegate.positions != positions;
  }
}