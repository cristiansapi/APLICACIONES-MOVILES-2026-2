import 'package:flutter/material.dart';
import 'package:flutter_app_1/screen/screen_basico1.dart';
import 'package:flutter_app_1/screen/screen_basico2.dart';
import 'package:flutter_app_1/screen/screen_calculadora.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenCalculadora(),
    );
  }
}
