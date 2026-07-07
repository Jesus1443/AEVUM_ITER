import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/avatar_repository.dart';
import '../../domain/entities/avatar.dart';

final avatarRepositoryProvider = Provider<AvatarRepository>(
  (ref) => const AvatarRepository(),
);

final avatarProvider = NotifierProvider<AvatarNotifier, Avatar?>(
  AvatarNotifier.new,
);

class AvatarNotifier extends Notifier<Avatar?> {
  late final AvatarRepository _repository;

  @override
  Avatar? build() {
    _repository = ref.read(avatarRepositoryProvider);
    return null;
  }

  List<Avatar> get avatars => _repository.getAll();

  void selectAvatar(Avatar avatar) {
    state = avatar;
  }

  void clearSelection() {
    state = null;
  }
}