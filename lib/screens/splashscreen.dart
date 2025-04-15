import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
          Image.asset(
            'assets/logo/BMI-Logo.png',
            width: 150,
            height: 150,
          ),
          Text(
            'Seu bem-estar começa aqui.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 44,
              color: Color(0xEEFFCE00),
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              height: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 60),
            child: Text(
              'Descubra mais sobre seu corpo e cuide da sua saúde de forma simples',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xEEFFCE00),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.fromLTRB(70, 7, 70, 7),
            ),
              onPressed: () {},
              child: Text('Comecar agora', style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25,
                color: Colors.black
              ),)

          ),
        ]
    ),)
    )
    ,
    );
  }
}
