import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  //const TelaSecundaria({Key? key}) : super(key: key);

  String? valor;

  TelaSecundaria({this.valor});

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Secundaria'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text('Segunda tela! '),
            ElevatedButton(
              child: Text('Ir para a primeira tela'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15)
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
      ),
    );
  }
}
