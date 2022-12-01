import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, 'banco.db');

    var bd = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          'CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)';

      db.execute(sql);
    });

    return bd;
    //print('Aberto ${bd.isOpen.toString()}');
  }

  _salvar() async {
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      'nome': 'Tixinha 26',
      'idade': 22,
    };
    int id = await bd.insert('usuarios', dadosUsuario);
    print('Salvo $id');
  }

  _listarUsuarios() async {
    Database bd = await _recuperarBancoDados();
    String sql = 'SELECT * FROM usuarios';
    List usuarios = await bd.rawQuery(sql);

    for (var usuario in usuarios) {
      print('item id: ${usuario['id']}' +
          '   nome: ${usuario['nome']}' +
          '  idade: ${usuario['idade']}');
    }
    //print('usuarios ${usuarios.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    //_recuperarBancoDados();
    //_salvar();
    _listarUsuarios();

    return Container();
  }
}
