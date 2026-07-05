import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import 'app_brand.dart';
import 'app_screen.dart';
import 'app_subtitle.dart';
import 'app_title.dart';

class FeatureLayout extends StatelessWidget {
  const FeatureLayout({
    required this.title, required this.child, super.key,
    this.subtitle,
    this.bottom,
    this.top,
    this.expandChild = true,
    this.showBrand = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
  });

  final String title;
  final String? subtitle;

  /// Widget opcional encima de la marca.
  /// Ejemplo: AppPageHeader para las pantallas con botón atrás.
  final Widget? top;

  final Widget child;
  final Widget? bottom;

  final bool expandChild;

  /// Mostrar u ocultar "Aevum Iter".
  final bool showBrand;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (top != null) ...[
            top!,
            const SizedBox(height: AppSpacing.lg),
          ],

          if (showBrand) ...[
            const AppBrand(),
            const SizedBox(height: AppSpacing.xl),
          ],

          AppTitle(title),

          if (subtitle != null) ...[
            const SizedBox(height: AppSpacing.sm),
            AppSubtitle(subtitle!),
          ],

          const SizedBox(height: AppSpacing.xl),

          if (expandChild)
            Expanded(child: child)
          else
            child,

          if (bottom != null) ...[
            const SizedBox(height: AppSpacing.lg),
            bottom!,
          ],
        ],
      ),
    );
  }
}