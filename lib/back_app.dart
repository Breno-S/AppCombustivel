import 'package:flutter/material.dart';

class AppAlcool extends StatefulWidget {
  const AppAlcool({Key? key}) : super(key: key);

  @override
  State<AppAlcool> createState() => _AppAlcoolState();
}

class _AppAlcoolState extends State<AppAlcool> {
  // BACK-END DO APP

  // pegar o input do TextField do alcool
  final TextEditingController _controllerAlcool = TextEditingController();
  // pegar o input do TextField da gasolina
  final TextEditingController _controllerGasolina = TextEditingController();
  // string que armazenará o resultado
  String _textoResultado = '';
  String _subtextoResultado = '';

  SizedBox icone = SizedBox();

  //criar uma função e declarar controller para double
  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    double? porcentagem;

    if(precoAlcool == null || precoGasolina == null) {
      icone = SizedBox(child: Icon(Icons.error_outline, size: 50, color: Colors.red,));
      setState(() {
        _textoResultado = 'Digite números maiores que zero e utilize ponto (.)';
        _subtextoResultado = '';
      });
    }
    else {
      porcentagem = precoAlcool/precoGasolina*100;
      if((porcentagem) >= 70) {
        setState(() {
          _textoResultado = 'Melhor abastecer com gasolina';
        });
      }
      else {
        setState(() {
          _textoResultado = 'Melhor abastecer com álcool';
        });
      }
      _subtextoResultado = 'Preço da álcool é ${porcentagem.toStringAsFixed(0)}% o da gasolina.';
      icone = SizedBox(child: Icon(Icons.attach_money_sharp, size: 50, color: Colors.green,));
    }
  }
  // FINAL DO BACK-END

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
    );
  }
}