import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enums/avatar_tab.dart';
import '../../domain/enums/hair_color.dart';
import '../../domain/enums/hair_style.dart';
import '../../domain/enums/outfit.dart';
import 'avatar_customization_state.dart';

final avatarCustomizationProvider = NotifierProvider<
    AvatarCustomizationNotifier,
    AvatarCustomizationState>(
  AvatarCustomizationNotifier.new,
);

class AvatarCustomizationNotifier
    extends Notifier<AvatarCustomizationState> {
  @override
  AvatarCustomizationState build() {
    return const AvatarCustomizationState();
  }

  void changeTab(AvatarTab tab) {
    state = state.copyWith(
      selectedTab: tab,
    );
  }

  void changeHairStyle(HairStyle style) {
    state = state.copyWith(
      hairStyle: style,
    );
  }

  void changeHairColor(HairColor color) {
    state = state.copyWith(
      hairColor: color,
    );
  }

  void changeOutfit(Outfit outfit) {
    state = state.copyWith(
      outfit: outfit,
    );
  }
}