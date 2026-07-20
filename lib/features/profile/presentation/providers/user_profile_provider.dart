import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../result/domain/entities/test_result.dart';
import '../../../test/domain/enums/riasec_dimension.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepositoryImpl(AppDatabase.instance),
);

/// Mantiene sincronizado el perfil visible en la interfaz con SQLite.
final userProfileProvider =
    NotifierProvider<UserProfileNotifier, UserProfile?>(
  UserProfileNotifier.new,
);

class UserProfileNotifier extends Notifier<UserProfile?> {
  late final ProfileRepository _repository;

  @override
  UserProfile? build() {
    _repository = ref.read(profileRepositoryProvider);
    return null;
  }

  Future<void> loadProfile() async {
    state = await _repository.getProfile();
  }

  Future<void> saveProfile(UserProfile profile) async {
    await _repository.saveProfile(profile);
    state = profile;
  }

  /// Guarda en el perfil el resultado más reciente del cuestionario.
  Future<void> saveLatestResult(TestResult result) async {
    final currentProfile = state ?? await _repository.getProfile();
    if (currentProfile == null) return;

    final updatedProfile = currentProfile.copyWith(
      hollandCode: result.riasecScores.hollandCode,
      dominantDimension: _dimensionLabel(
        result.riasecScores.dominantDimension,
      ),
      recommendedCareer: result.bestMatch.career.name,
      compatibility: result.bestMatch.compatibility,
    );

    await _repository.saveProfile(updatedProfile);
    state = updatedProfile;
  }

  Future<void> clearProfile() async {
    await _repository.deleteProfile();
    state = null;
  }

  String _dimensionLabel(RiasecDimension dimension) {
    switch (dimension) {
      case RiasecDimension.realistic:
        return 'Realista';
      case RiasecDimension.investigative:
        return 'Investigador';
      case RiasecDimension.artistic:
        return 'Artístico';
      case RiasecDimension.social:
        return 'Social';
      case RiasecDimension.enterprising:
        return 'Emprendedor';
      case RiasecDimension.conventional:
        return 'Convencional';
    }
  }
}
