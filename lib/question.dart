import 'package:flutter/material.dart';
class Question extends StatelessWidget {
  String questionText;
// {} se usa para named arguments. funciona como diccionario.
  Question(String text){
    questionText=text;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //Asegura que el contenedor coja toodo el spacio posible
        width: double.maxFinite,
        child:
    Text(questionText, style: TextStyle(fontSize: 40), textAlign: TextAlign.center,));
  }
}
