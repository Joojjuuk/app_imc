import 'package:flutter/material.dart';
import 'package:app_imc/screens/imc.dart';
import 'package:app_imc/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashscreen(),
    );

  }
}

