import 'package:flutter/material.dart';

class ScreenFormulario extends StatefulWidget {
  const ScreenFormulario({super.key});

  @override
  State<ScreenFormulario> createState() => _ScreenFormularioState();
}

class _ScreenFormularioState extends State<ScreenFormulario> {
  // controladores de los campos
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();

  void registrar() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes realizar la acción de registro, como enviar los datos a un servidor
      String nombre = _nombreController.text;
      String email = _emailController.text;

      // Por ejemplo, mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro exitoso: $nombre, $email')),
      );
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu email';
                  }
                  // Validación básica de email
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingresa un email válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrar,
                child: const Text('Registrar'),
              ),
            ],
          ),
        )
      )
    );
  }
}
