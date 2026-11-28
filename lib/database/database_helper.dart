import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  // Instancia única
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  // Obtener la conexión
  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  // Crear o abrir la base de datos
  Future<Database> _initDatabase() async {

    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'instituto.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Crear las tablas
  Future<void> _onCreate(Database db, int version) async {

    await db.execute('''
      CREATE TABLE estudiantes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        edad INTEGER NOT NULL
      )
    ''');

    

  }
}