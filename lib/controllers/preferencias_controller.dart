import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasController {
  // 1. CARGAR NOMBRE
  Future<String> cargarNombre() async {
    final prefs =  await SharedPreferences.getInstance();
    return prefs.getString('nombre') ?? '';
  }

  // 2. GUARDAR NOMBRE
  Future<void> guardarNombre(String nombre) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombre', nombre);
  }

  // 3. ELIMINAR NOMBRE
  Future<void> eliminarNombre() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('nombre');
  }
}
