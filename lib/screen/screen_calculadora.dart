import 'package:flutter/material.dart';
import 'package:flutter_app_1/controllers/calculadora_controller.dart';

class ScreenCalculadora extends StatefulWidget {
  const ScreenCalculadora({super.key});

  @override
  State<ScreenCalculadora> createState() => _ScreenCalculadoraState();
}

class _ScreenCalculadoraState extends State<ScreenCalculadora> {
  final numero1 = TextEditingController();
  final numero2 = TextEditingController();

  final objetocalculadora = CalculadoraController();

  double respuesta = 0;

  void sumar() {
    calcular('sumar');
  }

  void restar() {
    calcular('restar');
  }

  void multiplicar() {
    calcular('multiplicar');
  }

  void dividir() {
    calcular('dividir');
  }

  void calcular(String operacion) {
    double n1 = double.tryParse(numero1.text) ?? 0;
    double n2 = double.tryParse(numero2.text) ?? 0;

    setState(() {
      switch (operacion) {
        case 'sumar':
          respuesta = objetocalculadora.sumar(n1, n2);
          break;
        case 'restar':
          respuesta = objetocalculadora.restar(n1, n2);
          break;
        case 'multiplicar':
          respuesta = objetocalculadora.multiplicar(n1, n2);
          break;
        case 'dividir':
          respuesta = objetocalculadora.dividir(n1, n2);
          break;
      }
    });
  }

  Widget campoNumero(String etiqueta, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: const Icon(Icons.calculate_outlined),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget botonOperacion(String texto, IconData icono, VoidCallback accion) {
    return ElevatedButton.icon(
      onPressed: accion,
      icon: Icon(icono),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3157C8),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        title: const Text(
          'Calculadora',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3157C8),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // RESULTADO
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF3157C8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'RESULTADO',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    respuesta.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Ingrese los números',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            campoNumero('Primer número', numero1),

            const SizedBox(height: 15),

            campoNumero('Segundo número', numero2),

            const SizedBox(height: 30),

            const Text(
              'Seleccione una operación',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(child: botonOperacion('Sumar', Icons.add, sumar)),
                const SizedBox(width: 12),
                Expanded(child: botonOperacion('Restar', Icons.remove, restar)),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: botonOperacion(
                    'Multiplicar',
                    Icons.close,
                    multiplicar,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: botonOperacion('Dividir', Icons.percent, dividir),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    numero1.dispose();
    numero2.dispose();
    super.dispose();
  }
}
