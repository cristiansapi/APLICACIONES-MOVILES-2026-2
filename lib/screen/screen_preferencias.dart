import 'package:flutter/material.dart';
import 'package:flutter_app_1/controllers/preferencias_controller.dart';

class ScreenPreferencias extends StatefulWidget {
  const ScreenPreferencias({super.key});
  @override
  State<ScreenPreferencias> createState() => _ScreenPreferenciasState();
}

class _ScreenPreferenciasState extends State<ScreenPreferencias> {
  final preferencesController = PreferenciasController();
  final nombreController = TextEditingController();
  Future<void> cargarDatos() async {
    final nombre = await preferencesController.cargarNombre();
    setState(() {
      nombreController.text = nombre;
    });
  }

  Future<void> guardarDatos() async {
    final nombre = nombreController.text;
    await preferencesController.guardarNombre(nombre);
  }

  Future<void> eliminarDatos() async {
    await preferencesController.eliminarNombre();
    setState(() {
      nombreController.text = '';
    });
  }

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  @override
  void dispose() {
    nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),
      body: Column(
        children: [
          TextField(
            controller: nombreController,
            decoration: const InputDecoration(labelText: 'Nombre'),
          ),
          ElevatedButton(
            onPressed: guardarDatos,
            child: const Text('Guardar'),
          ),
          ElevatedButton(
            onPressed: eliminarDatos,
            child: const Text('Eliminar'),
          ),
        ],
      )
    );
  }
}
