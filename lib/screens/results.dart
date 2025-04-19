import 'package:app_imc/logic/imc_calculation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';

class Results extends StatefulWidget {
  final double imc;

  const Results({super.key, required this.imc});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  late String classificacao;
  late String descricaoclas;
  late String image;

  @override
  void initState() {
    super.initState();
    classificacao = classificarIMC(widget.imc);
    if (classificacao == "Magreza grave") {
      descricaoclas =
      "Você está com magreza grave. Estar abaixo do peso pode indicar deficiências nutricionais ou outros problemas de saúde. É importante buscar acompanhamento profissional para garantir que seu corpo esteja recebendo tudo o que precisa para funcionar bem.";
      image = 'assets/cartoons/GraveMagro.png';
    } else if (classificacao == "Magreza moderada") {
      descricaoclas =
      "Você está com magreza moderada. Estar abaixo do peso pode indicar deficiências nutricionais ou outros problemas de saúde. É importante buscar acompanhamento profissional para garantir que seu corpo esteja recebendo tudo o que precisa para funcionar bem.";
      image = 'assets/cartoons/Magro.png';
    } else if (classificacao == "Magreza leve") {
      descricaoclas =
      "Você está com magreza leve. Estar abaixo do peso pode indicar deficiências nutricionais ou outros problemas de saúde. É importante buscar acompanhamento profissional para garantir que seu corpo esteja recebendo tudo o que precisa para funcionar bem.";
      image = 'assets/cartoons/Magro.png';
    } else if (classificacao == "Saudável") {
      descricaoclas =
      "Parabéns! Seu IMC está dentro da faixa considerada saudável. Continue com seus bons hábitos de alimentação e atividade física para manter o equilíbrio e o bem-estar.";
      image = 'assets/cartoons/Saudavel.png';
    } else if (classificacao == "Sobrepeso") {
      descricaoclas =
      "Você está com sobrepeso. O sobrepeso pode aumentar o risco de problemas como hipertensão e diabetes. Pequenas mudanças na alimentação e na rotina de exercícios podem fazer uma grande diferença na sua saúde a longo prazo.";
      image = 'assets/cartoons/Obesidade.png';
    } else if (classificacao == "Obesidade Grau 1") {
      descricaoclas =
      "O IMC indica obesidade de grau 1, o que pode impactar diretamente sua qualidade de vida. É recomendado buscar acompanhamento médico e nutricional para iniciar um plano de reeducação alimentar e atividades físicas.";
      image = 'assets/cartoons/Obesidade.png';
    } else if (classificacao == "Obesidade Grau 2") {
      descricaoclas =
      "Você está com obesidade grau 2. A obesidade de grau 2 aumenta significativamente os riscos à saúde. Um plano de ação com orientação profissional pode ajudar a retomar o controle e promover bem-estar e qualidade de vida.";
      image = 'assets/cartoons/ObesidadeGrave.png';
    } else {
      descricaoclas =
      "Você está com obesidade grau 3. Essa é a faixa mais alta de obesidade e exige atenção especial. Acompanhamento médico, nutricional e psicológico pode ser fundamental para melhorar sua saúde física e emocional. Você não está sozinho nessa jornada.";
      image = 'assets/cartoons/ObesidadeGrave.png';
    }
  }

  Future<void> _saveResult() async {
    final prefs = await SharedPreferences.getInstance();
    final imcString = widget.imc.toStringAsFixed(2);
    final now = DateTime.now();
    final formattedDate =
        "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
    await prefs.setString('imc_$formattedDate',
        'IMC: $imcString - Classificação: $classificacao');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Resultado salvo!')),
    );
  }

  void _shareResult() {
    final imcString = widget.imc.toStringAsFixed(2);
    Share.share(
        'Meu IMC é: $imcString - Classificação: $classificacao - $descricaoclas');
  }

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
                  image,
                  scale: 2,
                ),
                Text('Seu imc é: ${widget.imc.toStringAsFixed(2)}',
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
                  descricaoclas,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: _shareResult,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFCE00),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.fromLTRB(70, 7, 70, 7)),
                  child: Text(
                    'Salvar Resultado',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}