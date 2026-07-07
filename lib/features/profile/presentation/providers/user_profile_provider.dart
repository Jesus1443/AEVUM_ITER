import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/profile_local_storage.dart';
import '../../domain/entities/user_profile.dart';

final profileLocalStorageProvider = Provider<ProfileLocalStorage>(
  (ref) => ProfileLocalStorage(),
);

final userProfileProvider =
    NotifierProvider<UserProfileNotifier, UserProfile?>(
  UserProfileNotifier.new,
);

class UserProfileNotifier extends Notifier<UserProfile?> {
  late final ProfileLocalStorage _storage;

  @override
  UserProfile? build() {
    _storage = ref.read(profileLocalStorageProvider);
    return null;
  }

  Future<void> loadProfile() async {
    state = await _storage.load();
  }

  Future<void> saveProfile(UserProfile profile) async {
    await _storage.save(profile);
    state = profile;
  }

  Future<void> clearProfile() async {
    await _storage.clear();
    state = null;
  }
}