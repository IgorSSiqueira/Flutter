import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({Key? key}) : super(key: key);

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String? _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            RadioListTile(
              title: Text('Masculino'),
                value: 'M',
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                  print('Resultado: ' + escolha!);
                }
            ),
            RadioListTile(
                title: Text('Feminino'),
                value: 'F',
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                  print('Resultado: ' + escolha!);
                }
            ),

            ElevatedButton(
              child: Text(
                'Salvar',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              onPressed: () {
                print('Resultado: ' + _escolhaUsuario!);
              },
            )


            /*
            Text('Masculino'),
            Radio(
                value: 'M',
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                  print('resultado: ' + escolha!);
                },
            ),
            Text('Feminino'),
            Radio(
              value: 'F',
              groupValue: _escolhaUsuario,
              onChanged: (String? escolha) {
                setState(() {
                  _escolhaUsuario = escolha;
                });
                print('resultado: ' + escolha!);
              },
            ), */

          ],
        ),
      ),
    );
  }
}
