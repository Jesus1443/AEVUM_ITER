import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    required this.child, super.key,
    this.padding = const EdgeInsets.all(24),
    this.margin = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.borderRadius = 32,
    this.elevation = 0,
    this.width,
    this.height,
    this.onTap,
  });

  final Widget child;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final Color backgroundColor;

  final double borderRadius;
  final double elevation;

  final double? width;
  final double? height;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget card = Material(
      color: backgroundColor,
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: child,
      ),
    );

    if (onTap != null) {
      card = InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: card,
      );
    }

    return Container(
      margin: margin,
      child: card,
    );
  }
}