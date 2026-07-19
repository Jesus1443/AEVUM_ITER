import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../test/domain/enums/riasec_dimension.dart';
import '../../domain/entities/riasec_scores.dart';

class RiasecRadarChart extends StatelessWidget {
  const RiasecRadarChart({
    required this.scores, super.key,
    this.size = 320,
    this.showPercentages = true,
  });

  final RiasecScores scores;
  final double size;
  final bool showPercentages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: 'Gráfico de resultados RIASEC',
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _RiasecRadarChartPainter(
            scores: scores,
            backgroundColor:
                theme.colorScheme.surfaceContainerHighest,
            gridColor: theme.colorScheme.outlineVariant,
            axisColor: theme.colorScheme.outline,
            dataColor: theme.colorScheme.primary,
            textColor: theme.colorScheme.onSurface,
            secondaryTextColor:
                theme.colorScheme.onSurfaceVariant,
            showPercentages: showPercentages,
          ),
        ),
      ),
    );
  }
}

class _RiasecRadarChartPainter extends CustomPainter {
  const _RiasecRadarChartPainter({
    required this.scores,
    required this.backgroundColor,
    required this.gridColor,
    required this.axisColor,
    required this.dataColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.showPercentages,
  });

  final RiasecScores scores;
  final Color backgroundColor;
  final Color gridColor;
  final Color axisColor;
  final Color dataColor;
  final Color textColor;
  final Color secondaryTextColor;
  final bool showPercentages;

  static const int _axisCount = 6;
  static const int _gridLevels = 5;

  static const List<RiasecDimension> _dimensions = [
    RiasecDimension.realistic,
    RiasecDimension.investigative,
    RiasecDimension.artistic,
    RiasecDimension.social,
    RiasecDimension.enterprising,
    RiasecDimension.conventional,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final chartRadius = math.min(
          size.width,
          size.height,
        ) *
        0.31;

    _drawBackground(
      canvas: canvas,
      center: center,
      radius: chartRadius,
    );

    _drawGrid(
      canvas: canvas,
      center: center,
      radius: chartRadius,
    );

    _drawAxes(
      canvas: canvas,
      center: center,
      radius: chartRadius,
    );

    _drawDataPolygon(
      canvas: canvas,
      center: center,
      radius: chartRadius,
    );

    _drawLabels(
      canvas: canvas,
      size: size,
      center: center,
      radius: chartRadius,
    );
  }

  void _drawBackground({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final path = _polygonPath(
      center: center,
      radius: radius,
    );

    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  void _drawGrid({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final paint = Paint()
      ..color = gridColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (var level = 1; level <= _gridLevels; level++) {
      final levelRadius =
          radius * (level / _gridLevels);

      final path = _polygonPath(
        center: center,
        radius: levelRadius,
      );

      canvas.drawPath(path, paint);
    }
  }

  void _drawAxes({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final paint = Paint()
      ..color = axisColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (var index = 0; index < _axisCount; index++) {
      final endpoint = _pointForIndex(
        center: center,
        radius: radius,
        index: index,
      );

      canvas.drawLine(
        center,
        endpoint,
        paint,
      );
    }
  }

  void _drawDataPolygon({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final path = Path();

    for (var index = 0; index < _dimensions.length; index++) {
      final dimension = _dimensions[index];
      final rawScore = scores.getScore(dimension);

      final normalizedScore =
          (rawScore / 100).clamp(0.0, 1.0);

      final point = _pointForIndex(
        center: center,
        radius: radius * normalizedScore,
        index: index,
      );

      if (index == 0) {
        path.moveTo(
          point.dx,
          point.dy,
        );
      } else {
        path.lineTo(
          point.dx,
          point.dy,
        );
      }
    }

    path.close();

    final fillPaint = Paint()
      ..color = dataColor.withValues(alpha: 0.25)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = dataColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);

    _drawDataPoints(
      canvas: canvas,
      center: center,
      radius: radius,
    );
  }

  void _drawDataPoints({
    required Canvas canvas,
    required Offset center,
    required double radius,
  }) {
    final outerPaint = Paint()
      ..color = dataColor
      ..style = PaintingStyle.fill;

    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (var index = 0; index < _dimensions.length; index++) {
      final dimension = _dimensions[index];
      final rawScore = scores.getScore(dimension);

      final normalizedScore =
          (rawScore / 100).clamp(0.0, 1.0);

      final point = _pointForIndex(
        center: center,
        radius: radius * normalizedScore,
        index: index,
      );

      canvas.drawCircle(
        point,
        5,
        outerPaint,
      );

      canvas.drawCircle(
        point,
        2,
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
    final labelRadius = radius + 42;

    for (var index = 0; index < _dimensions.length; index++) {
      final dimension = _dimensions[index];
      final labelPoint = _pointForIndex(
        center: center,
        radius: labelRadius,
        index: index,
      );

      final score = scores.getScore(dimension);

      final titlePainter = TextPainter(
        text: TextSpan(
          text: _shortLabelFor(dimension),
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      )..layout();

      final titleOffset = Offset(
        _adjustHorizontalPosition(
          index: index,
          centerX: labelPoint.dx,
          textWidth: titlePainter.width,
        ),
        labelPoint.dy - titlePainter.height / 2,
      );

      titlePainter.paint(
        canvas,
        _constrainOffset(
          offset: titleOffset,
          textSize: titlePainter.size,
          canvasSize: size,
        ),
      );

      if (!showPercentages) {
        continue;
      }

      final percentagePainter = TextPainter(
        text: TextSpan(
          text: '${score.round()}%',
          style: TextStyle(
            color: secondaryTextColor,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      )..layout();

      final percentageOffset = Offset(
        _adjustHorizontalPosition(
          index: index,
          centerX: labelPoint.dx,
          textWidth: percentagePainter.width,
        ),
        labelPoint.dy +
            titlePainter.height / 2 +
            2,
      );

      percentagePainter.paint(
        canvas,
        _constrainOffset(
          offset: percentageOffset,
          textSize: percentagePainter.size,
          canvasSize: size,
        ),
      );
    }
  }

  Path _polygonPath({
    required Offset center,
    required double radius,
  }) {
    final path = Path();

    for (var index = 0; index < _axisCount; index++) {
      final point = _pointForIndex(
        center: center,
        radius: radius,
        index: index,
      );

      if (index == 0) {
        path.moveTo(
          point.dx,
          point.dy,
        );
      } else {
        path.lineTo(
          point.dx,
          point.dy,
        );
      }
    }

    path.close();

    return path;
  }

  Offset _pointForIndex({
    required Offset center,
    required double radius,
    required int index,
  }) {
    final angle =
        (-math.pi / 2) +
        (2 * math.pi * index / _axisCount);

    return Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );
  }

  double _adjustHorizontalPosition({
    required int index,
    required double centerX,
    required double textWidth,
  }) {
    switch (index) {
      case 1:
      case 2:
        return centerX;
      case 4:
      case 5:
        return centerX - textWidth;
      default:
        return centerX - textWidth / 2;
    }
  }

  Offset _constrainOffset({
    required Offset offset,
    required Size textSize,
    required Size canvasSize,
  }) {
    final dx = offset.dx.clamp(
      0.0,
      math.max(
        0.0,
        canvasSize.width - textSize.width,
      ),
    );

    final dy = offset.dy.clamp(
      0.0,
      math.max(
        0.0,
        canvasSize.height - textSize.height,
      ),
    );

    return Offset(
      dx.toDouble(),
      dy.toDouble(),
    );
  }

  String _shortLabelFor(
    RiasecDimension dimension,
  ) {
    switch (dimension) {
      case RiasecDimension.realistic:
        return 'Realista';
      case RiasecDimension.investigative:
        return 'Investigador';
      case RiasecDimension.artistic:
        return 'Artístico';
      case RiasecDimension.social:
        return 'Social';
      case RiasecDimension.enterprising:
        return 'Emprendedor';
      case RiasecDimension.conventional:
        return 'Convencional';
    }
  }

  @override
  bool shouldRepaint(
    covariant _RiasecRadarChartPainter oldDelegate,
  ) {
    final scoresChanged = RiasecDimension.values.any(
      (dimension) {
        return oldDelegate.scores.getScore(dimension) !=
            scores.getScore(dimension);
      },
    );

    return scoresChanged ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.gridColor != gridColor ||
        oldDelegate.axisColor != axisColor ||
        oldDelegate.dataColor != dataColor ||
        oldDelegate.textColor != textColor ||
        oldDelegate.secondaryTextColor !=
            secondaryTextColor ||
        oldDelegate.showPercentages != showPercentages;
  }
}