import 'package:flutter/material.dart';
import 'back_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Alcool ou Gasolina'),
    ),
    body: SingleChildScrollView(
    padding: EdgeInsets.all(32),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch, // alinhamento de alongar
    children: <Widget>[
    Padding(padding: EdgeInsets.only(bottom:10),  //padding para evitar a logo grudada com o elemento de baixo
    child: Image.asset('image/logo.png'),
    ),
    Padding(padding: EdgeInsets.only(bottom:10),  //padding para evitar a logo grudada com o elemento de baixo
    child: Text('Saiba qual é a melhor opção para abastecer o seu carro.', style: TextStyle(fontSize: 20),),
    ),
    TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    labelText: 'Preço da gasolina (ex: 5.25)',
    ),
    style: TextStyle(fontSize: 22),
    controller: _controllerGasolina,
    ),
    TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
    labelText: 'Preço do Alcool (ex: 3.80)',
    ),
    style: TextStyle(fontSize: 22),
    controller: _controllerAlcool,
    ),
    Padding(padding: EdgeInsets.only(top: 10),
    child: ElevatedButton(
    onPressed: _calcular,
    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
    child: Text('Calcular'),
    ),
    ),
    Padding(padding: EdgeInsets.only(top: 20),
    child: ListTile(
    leading: icone,
    title: Text(_textoResultado),
    subtitle: Text(_subtextoResultado),
    ),
    ),
    ],
    ),
    ),
  };
}
