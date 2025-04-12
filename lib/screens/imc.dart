import 'package:app_imc/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_imc/logic/imc_calculation.dart';

class IMC extends StatelessWidget {
  IMC({super.key});

  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Text(
              "Bem vindo ao APP Calculo de IMC!!!",
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF664FA3),
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: TextField(
              controller: alturaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: InputDecoration(
                  labelText: "Altura em Metros",
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  hintText: "1.78",
                  hintStyle: TextStyle(
                    color: Color(0xCC000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                  suffixText: 'm',
                  suffixStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xCC000000),
                  )),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xB3000000)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: pesoController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: InputDecoration(
                    labelText: "Peso em KGs",
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    hintText: "60",
                    hintStyle: TextStyle(
                      color: Color(0xCC000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                    suffixText: "KG",
                    suffixStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xCC000000),
                    )),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: ElevatedButton(
                  onPressed: () {
                    final altura = double.tryParse(alturaController.text);
                    final peso = double.tryParse(pesoController.text);

                    if (altura != null && peso != null && altura > 0) {
                      final imc = peso / (altura * altura);
                      final resultado = classificarIMC(imc);
                      print("IMC: ${imc.toStringAsFixed(2)} - $resultado");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Results(imc: imc),
                        ),
                      );
                    } else {
                      print("Valores inválidos");
                    }
                  },
                child: Text("Calcular IMC"),
              )),
        ]),
      ),
    ));
  }
}
