import 'package:sqflite/sqflite.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/user_profile_model.dart';

/// Implementación SQLite del repositorio de perfil.
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._appDatabase);

  final AppDatabase _appDatabase;

  @override
  Future<UserProfile?> getProfile() async {
    final database = await _appDatabase.database;

    final rows = await database.query(
      AppDatabase.profileTable,
      where: 'id = ?',
      whereArgs: const [1],
      limit: 1,
    );

    if (rows.isEmpty) return null;
    return UserProfileModel.fromMap(rows.first);
  }

  @override
  Future<void> saveProfile(UserProfile profile) async {
    final database = await _appDatabase.database;
    final model = UserProfileModel.fromEntity(profile);

    // replace permite crear el registro o actualizarlo con una sola operación.
    await database.insert(
      AppDatabase.profileTable,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteProfile() async {
    final database = await _appDatabase.database;
    await database.delete(
      AppDatabase.profileTable,
      where: 'id = ?',
      whereArgs: const [1],
    );
  }
}
