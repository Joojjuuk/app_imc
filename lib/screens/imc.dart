import 'package:app_imc/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_imc/logic/imc_calculation.dart';



class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _ImcState();
}

class _ImcState extends State<IMC> {

final TextEditingController alturaController = TextEditingController();
final TextEditingController pesoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Vamos Comecar?',
                  style: TextStyle(
                    fontSize: 38,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFCE00),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 15, 35, 40),
                  child: Text(
                    'Preencha suas informações para calcular seu índice corporal.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: alturaController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*')),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Color(0xFFFFCE00),
                          filled: true,
                          suffixText: 'M',
                          suffixStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          labelText: 'Altura em Metros',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          floatingLabelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: pesoController,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*')),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Color(0xFFFFCE00),
                          filled: true,
                          suffixText: 'KG',
                          suffixStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          labelText: 'Peso em KG',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          floatingLabelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                Image.asset('assets/backgrounds/FundoEstilo.jpg'),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFCE00),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.fromLTRB(70, 7, 70, 7)
                  ),
                    onPressed: () {
                      final altura = double.tryParse(alturaController.text);
                      final peso = double.tryParse(pesoController.text);

                      if(altura != null && peso !=null){

                        final calculadora = IMCCalculo();
                        final imc = calculadora.calcularIMC(altura, peso);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Results(imc: imc,)));
                    }},
                    child: Text(
                      'Calcular IMC',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    )),
              ]),
            ),
          ),
        ));
  }
}
