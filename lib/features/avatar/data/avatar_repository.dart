import '../../../core/constants/app_assets.dart';
import '../domain/entities/avatar.dart';

class AvatarRepository {
  const AvatarRepository();

  List<Avatar> getAll() {
    return const [
      Avatar(
        id: 'avatar_01',
        name: 'Avatar 1',
        image: AppAssets.avatar01,
      ),
      Avatar(
        id: 'avatar_02',
        name: 'Avatar 2',
        image: AppAssets.avatar02,
      ),
      Avatar(
        id: 'avatar_03',
        name: 'Avatar 3',
        image: AppAssets.avatar03,
      ),
      Avatar(
        id: 'avatar_04',
        name: 'Avatar 4',
        image: AppAssets.avatar04,
      ),
      Avatar(
        id: 'avatar_05',
        name: 'Avatar 5',
        image: AppAssets.avatar05,
      ),
      Avatar(
        id: 'avatar_06',
        name: 'Avatar 6',
        image: AppAssets.avatar06,
      ),
    ];
  }

  Avatar? getById(String id) {
    try {
      return getAll().firstWhere((avatar) => avatar.id == id);
    } catch (_) {
      return null;
    }
  }
}