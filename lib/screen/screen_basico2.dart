import 'package:flutter/material.dart';
import 'package:flutter_app_1/controllers/suma_controller.dart';

class ScreenBasico2 extends StatefulWidget {
  @override
  State<ScreenBasico2> createState() => _ScreenBasico2State();
}

class _ScreenBasico2State extends State<ScreenBasico2> {
  final _numero1Controller1 = TextEditingController();
  final _numero2Controller2 = TextEditingController();
  double resultado = 0;
  void sumar() {
    final sumaController = SumaController();

    setState(() {
      resultado = sumaController.sumar(
        double.tryParse(_numero1Controller1.text) ?? 0,
        double.tryParse(_numero2Controller2.text) ?? 0,
      );
    });
  }

  void restar() {
    final sumaController = SumaController();

    setState(() {
      resultado = sumaController.restar(
        double.tryParse(_numero1Controller1.text) ?? 0,
        double.tryParse(_numero2Controller2.text) ?? 0,
      );
    });
  }

  void multiplicar() {
    final sumaController = SumaController();

    setState(() {
      resultado = sumaController.multiplicar(
        double.tryParse(_numero1Controller1.text) ?? 0,
        double.tryParse(_numero2Controller2.text) ?? 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de dos números')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _numero1Controller1,
              decoration: InputDecoration(labelText: 'Ingrese un número'),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _numero2Controller2,
              decoration: InputDecoration(labelText: 'Ingrese otro número'),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              onPressed: () => sumar(),
              child: Text('Sumar'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              onPressed: () => restar(),
              child: Text('Restar'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              onPressed: () => multiplicar(),
              child: Text('Multiplicar'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Resultado: $resultado",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
