import 'package:flutter/material.dart';

import '../models/estudiante.dart';
import '../repository/estudiante_repository.dart';

class EstudianteController extends ChangeNotifier {

  final _repository = EstudianteRepository();
  List<Estudiante> estudiantes = [];
  bool cargando = false;

  // LISTAR
  Future<void> listar() async {
    cargando = true;
    notifyListeners();
    try {
      estudiantes = await _repository.listar();

    } finally {
      cargando = false;
      notifyListeners();
    }
  }

  // INSERTAR
  Future<void> insertar(String nombre, int edad) async {
    final estudiante = Estudiante(
      nombre: nombre,
      edad: edad,
    );

    await _repository.insertar(estudiante);
    await listar();
  }

  // ACTUALIZAR
  Future<void> actualizar(Estudiante estudiante) async {
    await _repository.actualizar(estudiante);
    await listar();
  }

  // ELIMINAR
  Future<void> eliminar(int id) async {
    await _repository.eliminar(id);
    await listar();
  }
}