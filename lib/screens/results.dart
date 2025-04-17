import 'package:app_imc/logic/imc_calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Results extends StatelessWidget {
  final double imc;

  const Results({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    String classificacao = classificarIMC(imc);
    String Descricaoclas;
    if (classificacao == "Magreza grave") {
      Descricaoclas = "Você está com magreza grave. Procure um médico.";
    } else if (classificacao == "Magreza moderada") {
      Descricaoclas = "Você está com magreza moderada. Procure um médico.";
    } else if (classificacao == "Magreza leve") {
      Descricaoclas = "Você está com magreza leve. Procure um médico.";
    } else if (classificacao == "Saudável") {
      Descricaoclas = "Parabéns! Seu peso está saudável.";
    } else if (classificacao == "Sobrepeso") {
      Descricaoclas = "Você está com sobrepeso. Procure um médico.";
    } else if (classificacao == "Obesidade Grau 1") {
      Descricaoclas = "Você está com obesidade grau 1. Procure um médico.";
    } else if (classificacao == "Obesidade Grau 2") {
      Descricaoclas = "Você está com obesidade grau 2. Procure um médico.";
    } else {
      Descricaoclas = "Você está com obesidade grau 3. Procure um médico.";
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'assets/logo/BMI-Logo.png',
              fit: BoxFit.contain,
              height: 100,
            ),
            Text(
              'Calculator',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Column(
            children: [
              Text('Aqui está seu resultado!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  )),
              Image.asset(
                'assets/cartoons/Obesidade.png',
                scale: 2,
              ),
              Text('Seu imc é: $imc',
                  style: TextStyle(
                    color: Color(0xFFFFCE00),
                    fontSize: 38,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                Descricaoclas,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFCE00),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.fromLTRB(70, 7, 70, 7)),
                  onPressed: () {},
                  child: Text(
                    'Salvar Resultado',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
