import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/avatar.dart';
import 'avatar_card.dart';

class AvatarGrid extends StatelessWidget {
  const AvatarGrid({
    required this.avatars, required this.selectedAvatar, required this.onSelected, super.key,
  });

  final List<Avatar> avatars;
  final Avatar? selectedAvatar;
  final ValueChanged<Avatar> onSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: AppSpacing.lg,
        runSpacing: AppSpacing.lg,
        alignment: WrapAlignment.center,
        children: avatars.map((avatar) {
          return AvatarCard(
            avatar: avatar,
            isSelected: selectedAvatar?.id == avatar.id,
            onTap: () => onSelected(avatar),
          );
        }).toList(),
      ),
    );
  }
}