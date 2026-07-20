import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

/// Administra la única base de datos SQLite de AEVUM ITER.
///
/// Se implementa como singleton para evitar abrir varias conexiones a la misma
/// base de datos. Toda la aplicación reutiliza la conexión expuesta por
/// [database].
class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String databaseName = 'aevum_iter.db';
  static const int databaseVersion = 1;
  static const String profileTable = 'user_profile';

  Database? _database;

  /// Devuelve la conexión existente o abre la base por primera vez.
  Future<Database> get database async {
    final currentDatabase = _database;
    if (currentDatabase != null) return currentDatabase;

    final databasesPath = await getDatabasesPath();
    final databasePath = path.join(databasesPath, databaseName);

    _database = await openDatabase(
      databasePath,
      version: databaseVersion,
      onCreate: _onCreate,
    );

    return _database!;
  }

  /// Crea las tablas necesarias en la primera ejecución.
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $profileTable (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER NOT NULL,
        avatar_id TEXT NOT NULL,
        holland_code TEXT,
        dominant_dimension TEXT,
        recommended_career TEXT,
        compatibility REAL
      )
    ''');
  }

  /// Cierra la conexión. Es útil principalmente en pruebas automatizadas.
  Future<void> close() async {
    final currentDatabase = _database;
    if (currentDatabase == null) return;

    await currentDatabase.close();
    _database = null;
  }
}
