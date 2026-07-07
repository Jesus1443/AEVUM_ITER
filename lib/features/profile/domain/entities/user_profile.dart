class UserProfile {
  const UserProfile({
    required this.name,
    required this.avatarId,
  });

  final String name;
  final String avatarId;

  UserProfile copyWith({
    String? name,
    String? avatarId,
  }) {
    return UserProfile(
      name: name ?? this.name,
      avatarId: avatarId ?? this.avatarId,
    );
  }
}