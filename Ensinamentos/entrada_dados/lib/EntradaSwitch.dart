import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            SwitchListTile(
                title: Text('Receber notificações?'),
                value: _escolhaUsuario,
                onChanged: (bool valor) {
                  setState(() {
                    _escolhaUsuario = valor;
                  });
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
                print('Resultado: ' + _escolhaUsuario.toString());
              },
            )




            /*Switch(
                value: _escolhaUsuario,
                onChanged: (bool valor) {
                  setState(() {
                    _escolhaUsuario = valor;
                  });
                }
            ),
            Text('Receber notificações?')*/
          ],
        ),
      ),
    );
  }
}
