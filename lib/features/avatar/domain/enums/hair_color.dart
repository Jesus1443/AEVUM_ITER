import 'package:flutter/material.dart';

enum HairColor {
  black('Negro', Colors.black),
  brown('Castaño', Color(0xFF6D4C41)),
  blonde('Rubio', Color(0xFFFFD54F)),
  red('Rojo', Color(0xFFE53935)),
  white('Blanco', Color(0xFFE0E0E0));

  const HairColor(this.label, this.color);

  final String label;
  final Color color;
}