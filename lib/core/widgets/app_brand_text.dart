import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppBrandText extends StatelessWidget {
  const AppBrandText({
    super.key,
    this.fontSize = 22,
    this.color = AppColors.primaryDark,
    this.center = false,
  });

  final double fontSize;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Aevum Iter',
      textAlign: center ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
        height: 1,
      ),
    );
  }
}