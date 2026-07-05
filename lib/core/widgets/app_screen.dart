import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    required this.child, super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    this.backgroundColor = AppColors.backgroundLight,
    this.safeArea = true,
    this.resizeToAvoidBottomInset = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final Widget child;

  final EdgeInsetsGeometry padding;

  final Color backgroundColor;

  final bool safeArea;

  final bool resizeToAvoidBottomInset;

  final Widget? bottomNavigationBar;

  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: padding,
      child: child,
    );

    if (safeArea) {
      content = SafeArea(child: content);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: content,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}