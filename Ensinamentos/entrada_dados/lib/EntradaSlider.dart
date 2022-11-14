import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double valor = 0;
  String label = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: <Widget>[

            Slider(
                value: valor,
                min: 0,
                max: 10,
                label: label,
                divisions: 10,
                activeColor: Colors.lightGreen,
                inactiveColor: Colors.grey,
                onChanged: (double novoValor){
                  setState(() {
                    valor = novoValor;
                    label = novoValor.toString();
                  });
                  print('Valor Selecionado: '+ novoValor.toString());
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

                print('Valor selecionado: ' + valor.toString());
              },
            )

          ],
        ),
      ),
    );
  }
}
