import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  // Espaciados
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  // Border Radius
  static const Radius radiusSmall = Radius.circular(12);
  static const Radius radiusMedium = Radius.circular(16);
  static const Radius radiusLarge = Radius.circular(24);

  static const BorderRadius borderRadiusSmall =
      BorderRadius.all(radiusSmall);

  static const BorderRadius borderRadiusMedium =
      BorderRadius.all(radiusMedium);

  static const BorderRadius borderRadiusLarge =
      BorderRadius.all(radiusLarge);

  // Alturas
  static const double buttonHeight = 56;
  static const double textFieldHeight = 56;

  // Iconos
  static const double iconSmall = 20;
  static const double iconMedium = 24;
  static const double iconLarge = 32;

  // Avatar
  static const double avatarSmall = 56;
  static const double avatarMedium = 96;
  static const double avatarLarge = 140;
}