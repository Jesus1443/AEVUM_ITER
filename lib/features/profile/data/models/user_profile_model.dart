import '../../domain/entities/user_profile.dart';

/// Modelo responsable de convertir datos de SQLite a la entidad de dominio.
class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.age,
    required super.avatarId,
    super.hollandCode,
    super.dominantDimension,
    super.recommendedCareer,
    super.compatibility,
  });

  factory UserProfileModel.fromEntity(UserProfile profile) {
    return UserProfileModel(
      id: profile.id,
      name: profile.name,
      age: profile.age,
      avatarId: profile.avatarId,
      hollandCode: profile.hollandCode,
      dominantDimension: profile.dominantDimension,
      recommendedCareer: profile.recommendedCareer,
      compatibility: profile.compatibility,
    );
  }

  /// Convierte una fila obtenida de SQLite en un objeto Dart.
  factory UserProfileModel.fromMap(Map<String, Object?> map) {
    return UserProfileModel(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as int,
      avatarId: map['avatar_id'] as String,
      hollandCode: map['holland_code'] as String?,
      dominantDimension: map['dominant_dimension'] as String?,
      recommendedCareer: map['recommended_career'] as String?,
      compatibility: (map['compatibility'] as num?)?.toDouble(),
    );
  }

  /// Convierte el modelo al formato de columnas utilizado por SQLite.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'avatar_id': avatarId,
      'holland_code': hollandCode,
      'dominant_dimension': dominantDimension,
      'recommended_career': recommendedCareer,
      'compatibility': compatibility,
    };
  }
}
