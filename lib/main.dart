import 'package:flutter/material.dart';
import 'back_app.dart';

//App de gasolina ou alcool
//Se diferença entre gasolina e alcool <= 0.7 então abasteça com gasolina
//Senão abasteça com alcool
//preço_do_alcool/preço_da_gasolina >= 0.7

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App Alcool ou Gasolina',
    home: AppAlcool(),
    ));
}



