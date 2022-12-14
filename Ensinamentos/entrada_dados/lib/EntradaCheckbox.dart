import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrada de dados'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            CheckboxListTile(
              title: Text('Comida Brasileira'),
                subtitle: Text('A melhor comida...'),
                activeColor: Colors.green,
                //selected: true,
                secondary: Icon(Icons.add_box),
                value: _comidaBrasileira,
                onChanged: (bool? valor) {
                  setState(() {
                    _comidaBrasileira = valor!;
                  });
                }
            ),
            CheckboxListTile(
              title: Text('Comida Mexicana'),
                subtitle: Text('A melhor comida...'),
                activeColor: Colors.green,
                //selected: true,
                secondary: Icon(Icons.add_box),
                value: _comidaMexicana,
                onChanged: (bool? valor) {
                  setState(() {
                    _comidaMexicana = valor!;
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
                  print(
                    'Comida Brasileira: ' + _comidaBrasileira.toString() +
                      ' Comida Mexicana: ' + _comidaMexicana.toString()
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
