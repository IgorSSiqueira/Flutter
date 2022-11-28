// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    _itens = [];
    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item['titulo'] = 'Título ${i} chablau';
      item['descrição'] = 'Descrição ${i} chablauzovsk';
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, index) {
              //Map<String, dynamic> item = _itens[index];
              //print('item ${_itens[index]['titulo']}');

              return ListTile(
                onTap: () {
                  //print('clique com onTap ${index}');
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(_itens[index]['titulo']),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle:
                              TextStyle(fontSize: 20, color: Colors.orange),
                          content: Text(_itens[index]['descrição']),
                          actions: [
                            TextButton(
                              onPressed: () {
                                print('Selecionado sim');
                                Navigator.pop(context);
                              },
                              child: Text('Sim'),
                            ),
                            TextButton(
                              onPressed: () {
                                print('Selecionado não');
                                Navigator.pop(context);
                              },
                              child: Text('Não'),
                            ),
                          ],
                          //backgroundColor: Colors.red,
                        );
                      });
                },
                // onLongPress: (){
                //   print('clique com LongPress');
                // },

                title: Text(_itens[index]['titulo']),
                subtitle: Text(_itens[index]['descrição']),
              );
            }),
      ),
    );
  }
}
