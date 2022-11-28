import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    'Não pare, faça até dar errado!',
    'Seja o protagonista do seu fracasso!',
    'A vida te derruba hoje para a queda de amanhã!',
    'Só dará errado se você tentar!',
    'Quem não faz nada, não erra. E quem não erra é promovido!',
    'Lute como NUNCA. Perca como SEMPRE!!'
  ];

  var _fraseGerada = 'Clique abaixo para gerar uma frase!';

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Frases do dia'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            //width: double.infinity,
            /*decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber)
          ),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/logo.png'),
                Text(
                  _fraseGerada,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black),
                ),
                ElevatedButton(
                  child: Text(
                    'Nova Frase',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: _gerarFrase,
                )
              ],
            ),
          ),
        ));
  }
}
