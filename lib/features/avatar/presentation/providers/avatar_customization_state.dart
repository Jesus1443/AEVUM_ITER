import '../../domain/enums/avatar_tab.dart';
import '../../domain/enums/hair_color.dart';
import '../../domain/enums/hair_style.dart';
import '../../domain/enums/outfit.dart';

class AvatarCustomizationState {
  const AvatarCustomizationState({
    this.selectedTab = AvatarTab.hair,
    this.hairStyle = HairStyle.short,
    this.hairColor = HairColor.black,
    this.outfit = Outfit.casual,
  });

  final AvatarTab selectedTab;
  final HairStyle hairStyle;
  final HairColor hairColor;
  final Outfit outfit;

  AvatarCustomizationState copyWith({
    AvatarTab? selectedTab,
    HairStyle? hairStyle,
    HairColor? hairColor,
    Outfit? outfit,
  }) {
    return AvatarCustomizationState(
      selectedTab: selectedTab ?? this.selectedTab,
      hairStyle: hairStyle ?? this.hairStyle,
      hairColor: hairColor ?? this.hairColor,
      outfit: outfit ?? this.outfit,
    );
  }
}