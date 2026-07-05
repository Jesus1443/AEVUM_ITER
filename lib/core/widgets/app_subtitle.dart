import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppSubtitle extends StatelessWidget {
  const AppSubtitle(
    this.text, {
    super.key,
    this.textAlign = TextAlign.center,
    this.color = AppColors.textMuted,
    this.fontSize = 16,
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
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: color,
      ),
    );
  }
}