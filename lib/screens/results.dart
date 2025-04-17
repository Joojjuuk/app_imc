import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Results extends StatelessWidget {
  final double imc;

  const Results({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Text(
                  "Resultado do IMC: ${imc.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF664FA3),
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
