import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/dados.json");
  }

  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;

    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;

    setState(() {
      _listaTarefas.add(tarefa);
    });
    _salvarArquivo();

    _controllerTarefa.text = "";
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  Widget criarItemLista(context, index) {
    final item = _listaTarefas[index]['titulo'];

    return Dismissible(
      key: Key(item),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _listaTarefas.removeAt(index);
        _salvarArquivo();
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          )
        ]),
      ),
      child: CheckboxListTile(
          value: _listaTarefas[index]['realizada'],
          title: Text(_listaTarefas[index]['titulo']),
          onChanged: (valorAlterado) {
            setState(() {
              _listaTarefas[index]['realizada'] = valorAlterado;
            });

            _salvarArquivo();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    //_salvarArquivo();
    print("itens: ${_listaTarefas.toString()}");

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Adicionar Tarefa'),
                  content: TextField(
                    controller: _controllerTarefa,
                    decoration: InputDecoration(labelText: 'Digite sua tarefa'),
                    onChanged: (text) {},
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancelar')),
                    TextButton(
                        onPressed: () {
                          _salvarTarefa();
                          Navigator.pop(context);
                        },
                        child: Text('Salvar'))
                  ],
                );
              });
        },
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _listaTarefas.length, itemBuilder: criarItemLista))
        ],
      ),
    );
  }
}
