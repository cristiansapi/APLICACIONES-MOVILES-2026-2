
import 'package:flutter/material.dart';

class ScreenValidacion extends StatefulWidget {
  const ScreenValidacion({super.key});

  @override
  State<ScreenValidacion> createState() => _ScreenValidacionState();
}

class _ScreenValidacionState extends State<ScreenValidacion> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormularioEstudiante(),
    );
  }
}

// ==========================================
// PANTALLA: FORMULARIO ESTUDIANTE
// ==========================================

class FormularioEstudiante extends StatefulWidget {
  const FormularioEstudiante({super.key});

  @override
  State<FormularioEstudiante> createState() =>
      _FormularioEstudianteState();
}

// ==========================================
// ESTADO Y LÓGICA DEL FORMULARIO
// ==========================================

class _FormularioEstudianteState
    extends State<FormularioEstudiante> {

  // 1. Controlar el formulario
  final _formKey = GlobalKey<FormState>();

  // 2. Controlar los campos
  final nombreController = TextEditingController();
  final correoController = TextEditingController();

  // 3. Validar y registrar
  void registrar() {

    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Registro exitoso!'),
          backgroundColor: Colors.green,
        ),
      );

      print('Nombre: ${nombreController.text}');
      print('Correo: ${correoController.text}');
    }
  }

  // 4. Liberar los controladores
  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    super.dispose();
  }

  // 5. Construir la interfaz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de estudiantes'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              // CAMPO NOMBRE
              TextFormField(
                controller: nombreController,

                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su nombre';
                  }

                  if (value.trim().length < 3) {
                    return 'Mínimo 3 caracteres';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // CAMPO CORREO
              TextFormField(
                controller: correoController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su correo';
                  }

                  if (!RegExp(
                    r'^[^@]+@[^@]+\.[^@]+$',
                  ).hasMatch(value.trim())) {
                    return 'Ingrese un correo válido';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              // BOTÓN REGISTRAR
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: registrar,
                  child: const Text('REGISTRAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
