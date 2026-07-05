import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppTitle extends StatelessWidget {
  const AppTitle(
    this.text, {
    super.key,
    this.textAlign = TextAlign.center,
    this.color = AppColors.primaryDark,
    this.fontSize = 28,
  });

  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
        height: 1.15,
      ),
    );
  }
}