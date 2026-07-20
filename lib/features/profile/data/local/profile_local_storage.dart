import '../../../../core/database/app_database.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../repositories/profile_repository_impl.dart';

/// Fachada de compatibilidad para el código que antes usaba SharedPreferences.
///
/// Ahora todas las operaciones se delegan a SQLite.
class ProfileLocalStorage {
  ProfileLocalStorage({ProfileRepository? repository})
      : _repository = repository ??
            ProfileRepositoryImpl(AppDatabase.instance);

  final ProfileRepository _repository;

  Future<void> save(UserProfile profile) => _repository.saveProfile(profile);
  Future<UserProfile?> load() => _repository.getProfile();
  Future<void> clear() => _repository.deleteProfile();
}
