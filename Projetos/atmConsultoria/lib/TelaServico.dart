// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  const TelaServico({Key? key}) : super(key: key);

  @override
  State<TelaServico> createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Serviços'),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('images/detalhe_servico.png'),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Serviços',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                  'Consultoria'
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                  'Cálculo de preços'
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                  'Acompanhamento de prejetos'
              ),
            )
          ],
        ),
      ),
    );
  }
}
