import 'package:flutter/material.dart';

import '../controllers/estudiante_controller.dart';

class EstudianteScreen extends StatefulWidget {
  const EstudianteScreen({super.key});

  @override
  State<EstudianteScreen> createState() => _EstudianteScreenState();
}

class _EstudianteScreenState extends State<EstudianteScreen> {
  final controller = EstudianteController();

  final txtNombre = TextEditingController();
  final txtEdad = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.listar();
  }

  // REGISTRAR
  Future<void> registrar() async {
    final nombre = txtNombre.text.trim();
    final edad = int.tryParse(txtEdad.text);
    if (nombre.isEmpty || edad == null || edad <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese un nombre y una edad válida')),
      );
      return;
    }

    try {
      await controller.insertar(nombre, edad);
      txtNombre.clear();
      txtEdad.clear();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Estudiante registrado correctamente')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  void dispose() {
    txtNombre.dispose();
    txtEdad.dispose();
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de estudiantes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // NOMBRE
            TextField(
              controller: txtNombre,
              decoration: const InputDecoration(
                labelText: 'Nombre del estudiante',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // EDAD
            TextField(
              controller: txtEdad,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // BOTÓN REGISTRAR
            ElevatedButton(
              onPressed: registrar,
              child: const Text('Guardar estudiante'),
            ),

            const Divider(height: 30),

            // LISTADO
            Expanded(
              child: ListenableBuilder(
                listenable: controller,

                builder: (context, child) {
                  if (controller.cargando) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.estudiantes.isEmpty) {
                    return const Center(
                      child: Text('No hay estudiantes registrados'),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.estudiantes.length,

                    itemBuilder: (context, index) {
                      final estudiante = controller.estudiantes[index];

                      return ListTile(
                        title: Text(estudiante.nombre),

                        subtitle: Text('Edad: ${estudiante.edad}'),

                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),

                          onPressed: () async {
                            await controller.eliminar(estudiante.id!);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}