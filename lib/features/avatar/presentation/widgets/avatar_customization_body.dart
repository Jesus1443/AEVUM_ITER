import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_tab.dart';
import '../../domain/enums/hair_color.dart';
import '../../domain/enums/hair_style.dart';
import '../../domain/enums/outfit.dart';
import '../providers/avatar_customization_state.dart';
import 'avatar_preview.dart';

class AvatarCustomizationBody extends StatelessWidget {
  const AvatarCustomizationBody({
    required this.avatar,
    required this.state,
    required this.onTabChanged,
    required this.onHairStyleChanged,
    required this.onHairColorChanged,
    required this.onOutfitChanged,
    super.key,
  });

  final Avatar avatar;
  final AvatarCustomizationState state;
  final ValueChanged<AvatarTab> onTabChanged;
  final ValueChanged<HairStyle> onHairStyleChanged;
  final ValueChanged<HairColor> onHairColorChanged;
  final ValueChanged<Outfit> onOutfitChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AvatarPreview(avatar: avatar),
          const SizedBox(height: AppSpacing.xl),
          AppTabs<AvatarTab>(
            values: AvatarTab.values,
            selectedValue: state.selectedTab,
            labelBuilder: (tab) => tab.label,
            onChanged: onTabChanged,
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildSelectedContent(),
        ],
      ),
    );
  }

  Widget _buildSelectedContent() {
    return switch (state.selectedTab) {
      AvatarTab.hair => _HairContent(
          selectedStyle: state.hairStyle,
          selectedColor: state.hairColor,
          onStyleChanged: onHairStyleChanged,
          onColorChanged: onHairColorChanged,
        ),
      AvatarTab.outfit => _OutfitContent(
          selectedOutfit: state.outfit,
          onChanged: onOutfitChanged,
        ),
      AvatarTab.accessory => const AppSubtitle(
          'Los accesorios estarán disponibles próximamente.',
        ),
    };
  }
}

class _HairContent extends StatelessWidget {
  const _HairContent({
    required this.selectedStyle,
    required this.selectedColor,
    required this.onStyleChanged,
    required this.onColorChanged,
  });

  final HairStyle selectedStyle;
  final HairColor selectedColor;
  final ValueChanged<HairStyle> onStyleChanged;
  final ValueChanged<HairColor> onColorChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          alignment: WrapAlignment.center,
          children: HairStyle.values.map((style) {
            return OptionCard(
              title: style.label,
              selected: selectedStyle == style,
              onTap: () => onStyleChanged(style),
              child: const Icon(Icons.face_retouching_natural, size: 44),
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        const AppTitle(
          'Color de cabello',
          fontSize: 20,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.md),
        ColorPicker(
          colors: HairColor.values.map((color) => color.color).toList(),
          selectedColor: selectedColor.color,
          onChanged: (color) {
            final selected = HairColor.values.firstWhere(
              (hairColor) => hairColor.color == color,
            );
            onColorChanged(selected);
          },
        ),
      ],
    );
  }
}

class _OutfitContent extends StatelessWidget {
  const _OutfitContent({
    required this.selectedOutfit,
    required this.onChanged,
  });

  final Outfit selectedOutfit;
  final ValueChanged<Outfit> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      alignment: WrapAlignment.center,
      children: Outfit.values.map((outfit) {
        return OptionCard(
          title: outfit.label,
          selected: selectedOutfit == outfit,
          onTap: () => onChanged(outfit),
          child: const Icon(Icons.checkroom_rounded, size: 44),
        );
      }).toList(),
    );
  }
}