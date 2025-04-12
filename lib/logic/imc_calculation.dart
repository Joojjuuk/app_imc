String classificarIMC(double imc) {
  if (imc < 16) {
    return "Magreza grave";
  } else if (imc < 17) {
    return "Magreza moderada";
  } else if (imc < 18.5) {
    return "Magreza leve";
  } else if (imc < 25) {
    return "Saudável";
  } else if (imc < 30) {
    return "Sobrepeso";
  } else if (imc < 35) {
    return "Obesidade Grau 1";
  } else if (imc < 40) {
    return "Obesidade Grau 2";
  } else {
    return "Obesidade Grau 3";
  }
}
