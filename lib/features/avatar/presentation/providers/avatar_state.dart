import '../../domain/entities/avatar.dart';

class AvatarState {
  const AvatarState({
    this.selectedAvatar,
  });

  final Avatar? selectedAvatar;

  bool get hasSelection => selectedAvatar != null;

  AvatarState copyWith({
    Avatar? selectedAvatar,
    bool clearSelection = false,
  }) {
    return AvatarState(
      selectedAvatar:
          clearSelection ? null : (selectedAvatar ?? this.selectedAvatar),
    );
  }
}