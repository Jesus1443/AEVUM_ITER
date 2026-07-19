import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../test/domain/enums/riasec_type.dart';
import '../../domain/entities/riasec_scores.dart';

class RiasecRadarChart extends StatelessWidget {
  const RiasecRadarChart({
    required this.scores,
    this.size = 280,
    super.key,
  });

  final RiasecScores scores;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RiasecRadarPainter(
          scores: scores,
        ),
      ),
    );
  }
}

class _RiasecRadarPainter extends CustomPainter {
  const _RiasecRadarPainter({
    required this.scores,
  });

  final RiasecScores scores;

  static const List<RiasecType> _types = [
    RiasecType.investigative,
    RiasecType.artistic,
    RiasecType.social,
    RiasecType.enterprising,
    RiasecType.conventional,
    RiasecType.realistic,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = math.min(
          size.width,
          size.height,
        ) /
        2.75;

    _drawGrid(
      canvas: canvas,
      center: center,
      radius: radius,
    );

    _drawAxes(
      canvas: canvas,
      center: center,
      radius: radius,
    );

    _drawScoreArea(
      canvas: canvas,
      center: center,
      radius: radius,
    );

    _drawLabels(
      canvas: canvas,
      size: size,
      center: center,
      radius: radius,
    );
  }

  void _drawGrid({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final gridPaint = Paint()
      ..color = AppColors.primaryDark.withValues(alpha: 0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    const levels = 5;

    for (var level = 1; level <= levels; level++) {
      final levelRadius = radius * (level / levels);

      final path = _polygonPath(
        center: center,
        radius: levelRadius,
      );

      canvas.drawPath(path, gridPaint);
    }
  }

  void _drawAxes({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final axisPaint = Paint()
      ..color = AppColors.primaryDark.withValues(alpha: 0.12)
      ..strokeWidth = 1.1;

    for (var index = 0; index < _types.length; index++) {
      final point = _pointFor(
        center: center,
        radius: radius,
        index: index,
      );

      canvas.drawLine(
        center,
        point,
        axisPaint,
      );
    }
  }

  void _drawScoreArea({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final scorePath = Path();

    for (var index = 0; index < _types.length; index++) {
      final type = _types[index];
      final score = scores.scoreOf(type).clamp(0, 100);
      final scoreRadius = radius * (score / 100);

      final point = _pointFor(
        center: center,
        radius: scoreRadius,
        index: index,
      );

      if (index == 0) {
        scorePath.moveTo(point.dx, point.dy);
      } else {
        scorePath.lineTo(point.dx, point.dy);
      }
    }

    scorePath.close();

    final fillPaint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.28)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = AppColors.primaryDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(scorePath, fillPaint);
    canvas.drawPath(scorePath, borderPaint);

    _drawScorePoints(
      canvas: canvas,
      center: center,
      radius: radius,
    );
  }

  void _drawScorePoints({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final outerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final innerPaint = Paint()
      ..color = AppColors.primaryDark
      ..style = PaintingStyle.fill;

    for (var index = 0; index < _types.length; index++) {
      final type = _types[index];
      final score = scores.scoreOf(type).clamp(0, 100);
      final scoreRadius = radius * (score / 100);

      final point = _pointFor(
        center: center,
        radius: scoreRadius,
        index: index,
      );

      canvas.drawCircle(
        point,
        5.5,
        outerPaint,
      );

      canvas.drawCircle(
        point,
        3.5,
        innerPaint,
      );
    }
  }

  void _drawLabels({
    required Canvas canvas,
    required Size size,
    required Offset center,
    required double radius,
  }) {
    final labelRadius = radius + 31;

    for (var index = 0; index < _types.length; index++) {
      final type = _types[index];

      final point = _pointFor(
        center: center,
        radius: labelRadius,
        index: index,
      );

      final percentage = scores.scoreOf(type).clamp(0, 100).round();

      final textPainter = TextPainter(
        text: TextSpan(
          children: [
            TextSpan(
              text: '${_shortNameOf(type)}\n',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            TextSpan(
              text: '$percentage%',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout(
          maxWidth: 76,
        );

      final offset = Offset(
        point.dx - (textPainter.width / 2),
        point.dy - (textPainter.height / 2),
      );

      textPainter.paint(
        canvas,
        Offset(
          offset.dx.clamp(
            0,
            size.width - textPainter.width,
          ),
          offset.dy.clamp(
            0,
            size.height - textPainter.height,
          ),
        ),
      );
    }
  }

  Path _polygonPath({
    required Offset center,
    required double radius,
  }) {
    final path = Path();

    for (var index = 0; index < _types.length; index++) {
      final point = _pointFor(
        center: center,
        radius: radius,
        index: index,
      );

      if (index == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();

    return path;
  }

  Offset _pointFor({
    required Offset center,
    required double radius,
    required int index,
  }) {
    final angle = (-math.pi / 2) +
        (2 * math.pi * index / _types.length);

    return Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );
  }

  String _shortNameOf(RiasecType type) {
    return switch (type) {
      RiasecType.realistic => 'Realista',
      RiasecType.investigative => 'Investigador',
      RiasecType.artistic => 'Artístico',
      RiasecType.social => 'Social',
      RiasecType.enterprising => 'Emprendedor',
      RiasecType.conventional => 'Convencional',
    };
  }

  @override
  bool shouldRepaint(
    covariant _RiasecRadarPainter oldDelegate,
  ) {
    return oldDelegate.scores.values != scores.values;
  }
}