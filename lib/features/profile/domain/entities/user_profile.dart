/// Representa el único perfil local de la aplicación.
///
/// Los datos personales y el último resultado vocacional se almacenan juntos
/// porque AEVUM ITER no maneja autenticación ni historial de resultados.
class UserProfile {
  const UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.avatarId,
    this.hollandCode,
    this.dominantDimension,
    this.recommendedCareer,
    this.compatibility,
  });

  /// La aplicación utiliza siempre el registro con id = 1.
  final int id;
  final String name;
  final int age;
  final String avatarId;
  final String? hollandCode;
  final String? dominantDimension;
  final String? recommendedCareer;
  final double? compatibility;

  /// Crea una nueva instancia conservando los valores no modificados.
  UserProfile copyWith({
    int? id,
    String? name,
    int? age,
    String? avatarId,
    String? hollandCode,
    String? dominantDimension,
    String? recommendedCareer,
    double? compatibility,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      avatarId: avatarId ?? this.avatarId,
      hollandCode: hollandCode ?? this.hollandCode,
      dominantDimension: dominantDimension ?? this.dominantDimension,
      recommendedCareer: recommendedCareer ?? this.recommendedCareer,
      compatibility: compatibility ?? this.compatibility,
    );
  }
}
