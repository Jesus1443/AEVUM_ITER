import 'package:flutter/material.dart';

import 'app_back_button.dart';
import 'app_title.dart';

class AppPageHeader extends StatelessWidget {
  const AppPageHeader({
    required this.title, super.key,
    this.showBackButton = false,
    this.trailing,
  });

  final String title;
  final bool showBackButton;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showBackButton)
            const Align(
              alignment: Alignment.centerLeft,
              child: AppBackButton(),
            ),

          AppTitle(
            title,
            fontSize: 24,
          ),

          if (trailing != null)
            Align(
              alignment: Alignment.centerRight,
              child: trailing!,
            ),
        ],
      ),
    );
  }
}