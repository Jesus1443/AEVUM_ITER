import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/avatar.dart';
import 'avatar_state.dart';

final avatarProvider =
    NotifierProvider<AvatarNotifier, AvatarState>(
  AvatarNotifier.new,
);

class AvatarNotifier extends Notifier<AvatarState> {
  @override
  AvatarState build() {
    return const AvatarState();
  }

  void selectAvatar(Avatar avatar) {
    state = state.copyWith(
      selectedAvatar: avatar,
    );
  }

  void clearSelection() {
    state = state.copyWith(
      clearSelection: true,
    );
  }
}