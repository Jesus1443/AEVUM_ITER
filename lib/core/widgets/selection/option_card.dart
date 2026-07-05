import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../constants/app_duration.dart';
import '../../constants/app_radius.dart';
import '../../constants/app_spacing.dart';

/// Tarjeta seleccionable reutilizable.
///
/// Se utiliza para representar una opción dentro de un conjunto.
/// Ejemplos:
/// - Cabello
/// - Ropa
/// - Accesorios
/// - Opciones de un test
/// - Configuración
class OptionCard extends StatelessWidget {
  const OptionCard({
    required this.title,
    required this.child,
    required this.onTap,
    super.key,
    this.selected = false,
  });

  final String title;
  final Widget child;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDuration.normal,
      curve: Curves.easeOut,
      width: 140,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: selected
              ? AppColors.primary
              : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  duration: AppDuration.normal,
                  scale: selected ? 1.08 : 1,
                  child: child,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: selected
                        ? AppColors.primary
                        : AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}