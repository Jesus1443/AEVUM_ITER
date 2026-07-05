import 'package:flutter/material.dart';

import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/avatar.dart';

class AvatarPreview extends StatelessWidget {
  const AvatarPreview({
    required this.avatar,
    super.key,
  });

  final Avatar avatar;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 210,
        height: 210,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.xl),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Hero(
          tag: avatar.id,
          child: Image.asset(
            avatar.baseAvatarImage,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}