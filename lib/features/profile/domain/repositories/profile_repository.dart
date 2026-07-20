import '../entities/user_profile.dart';

/// Contrato del almacenamiento del perfil.
///
/// El dominio no conoce SQLite; únicamente conoce esta interfaz.
abstract interface class ProfileRepository {
  Future<UserProfile?> getProfile();
  Future<void> saveProfile(UserProfile profile);
  Future<void> deleteProfile();
}
