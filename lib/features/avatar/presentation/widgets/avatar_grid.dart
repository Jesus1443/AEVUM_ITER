import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../domain/entities/avatar.dart';
import 'avatar_card.dart';

class AvatarGrid extends StatelessWidget {
  const AvatarGrid({
    required this.avatars,
    required this.selectedAvatar,
    required this.onSelected,
    super.key,
  });

  final List<Avatar> avatars;
  final Avatar? selectedAvatar;
  final ValueChanged<Avatar> onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      itemCount: avatars.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSpacing.lg,
        mainAxisSpacing: AppSpacing.lg,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final avatar = avatars[index];

        return AvatarCard(
          avatar: avatar,
          isSelected: selectedAvatar?.id == avatar.id,
          onTap: () => onSelected(avatar),
        );
      },
    );
  }
}