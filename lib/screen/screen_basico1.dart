import 'package:flutter/material.dart';

class ScreenBasico1 extends StatelessWidget {
  const ScreenBasico1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(width: 200, height: 200, color: Colors.green),
      ),
    );
  }
}
