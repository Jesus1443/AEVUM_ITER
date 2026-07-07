import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_profile.dart';

class ProfileLocalStorage {
  static const _profileKey = 'user_profile';

  Future<void> save(UserProfile profile) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _profileKey,
      jsonEncode({
        'name': profile.name,
        'avatarId': profile.avatarId,
      }),
    );
  }

  Future<UserProfile?> load() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(_profileKey);

    if (json == null) return null;

    final map = jsonDecode(json);

    return UserProfile(
      name: map['name'],
      avatarId: map['avatarId'],
    );
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_profileKey);
  }
}