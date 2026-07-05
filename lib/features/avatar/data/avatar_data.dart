import '../../../core/constants/app_assets.dart';
import '../domain/entities/avatar.dart';

class AvatarData {
  AvatarData._();

  static const avatars = <Avatar>[
    Avatar(
      id: 'explorer',
      name: 'Explorador',
      baseAvatarImage: AppAssets.explorerAvatar,
    ),
    Avatar(
      id: 'scientist',
      name: 'Científica',
      baseAvatarImage: AppAssets.scientistAvatar,
    ),
    Avatar(
      id: 'artist',
      name: 'Artista',
      baseAvatarImage: AppAssets.artistAvatar,
    ),
    Avatar(
      id: 'leader',
      name: 'Líder',
      baseAvatarImage: AppAssets.leaderAvatar,
    ),
  ];
}