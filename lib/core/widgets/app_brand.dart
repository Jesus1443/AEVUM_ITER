import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

/// Identidad visual de la aplicación.
///
/// Utilízalo en todas las pantallas donde deba mostrarse
/// el nombre "Aevum Iter".
class AppBrand extends StatelessWidget {
  const AppBrand({
    super.key,
    this.fontSize = 22,
    this.color = AppColors.primaryDark,
    this.textAlign = TextAlign.center,
  });

  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Aevum Iter',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
        height: 1,
      ),
    );
  }
}