import '../database/database_helper.dart';
import '../models/estudiante.dart';

class EstudianteRepository {

  // Obtener conexión
  final _database = DatabaseHelper.instance;

  // 1. REGISTRAR ESTUDIANTE
  Future<int> insertar(Estudiante estudiante) async {
    final db = await _database.database;
    return await db.insert(
      'estudiantes',
      estudiante.toMap(),
    );
  }

  // 2. LISTAR ESTUDIANTES
  Future<List<Estudiante>> listar() async {
    final db = await _database.database;
    final resultado = await db.query('estudiantes');
    return resultado
        .map((fila) => Estudiante.fromMap(fila))
        .toList();

  }

  // 3. BUSCAR ESTUDIANTE POR ID
  Future<Estudiante?> buscarPorId(int id) async {
    final db = await _database.database;
    final resultado = await db.query(
      'estudiantes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (resultado.isEmpty) {
      return null;
    }

    return Estudiante.fromMap(resultado.first);

  }

  // 4. ACTUALIZAR ESTUDIANTE
  Future<int> actualizar(Estudiante estudiante) async {
    final db = await _database.database;
    return await db.update(
      'estudiantes',
      estudiante.toMap(),
      where: 'id = ?',
      whereArgs: [estudiante.id],
    );
  }

  // 5. ELIMINAR ESTUDIANTE
  Future<int> eliminar(int id) async {
    final db = await _database.database;
    return await db.delete(
      'estudiantes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}