// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllercep = TextEditingController();

  String _resultado = 'Resultado';

  _recuperarCep() async {
    String cepDigitado = _controllercep.text;
    String cep = '13455140';
    String url = 'https://viacep.com.br/ws/${cepDigitado}/json/';
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);
    String logradouro = retorno['logradouro'];
    String bairro = retorno['bairro'];
    String localidade = retorno['localidade'];

    setState(() {
      _resultado = 'logradouro: ${logradouro} bairro: ${bairro} localidade: ${localidade}';
    });

    print(
      'logradouro: ${logradouro} bairro: ${bairro} localidade: ${localidade}'
    );

    //print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de serviço web'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o cep: ex: 11111111'
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllercep,
            ),
            ElevatedButton(
              child: Text('Clique aqui'),
              onPressed: _recuperarCep,
            ),
            Text(_resultado)
          ],
        ),
      ),
    );
  }
}
