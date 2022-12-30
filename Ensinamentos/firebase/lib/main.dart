// @dart=2.9

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  //Inicializar Firebase
  WidgetsFlutterBinding.ensureInitialized();

  //Firestore db = Firestore.instance;

  /*db.collection('usuarios').document('002').setData({
    'nome': 'Ana Maria Silva',
    'idade': '25',
  });
  /*Firestore.instance
      .collection('usuarios')
      .document('pontuacao')
      .setData({'Igor': '250', 'Ana': '590'});*/
  
    Adicionando com .add, cria a chave automaticamente.
    Sendo então bom colocar a chave em uma variável para encontrar ela
  DocumentReference ref = await db.collection('noticias').add({
    'titulo': 'Ondas de calor em São Paulo',
    'idade': 'texto exemplo',
  });
  print('item salvo: ${ref.documentID}');
  db.collection('noticias').document('thueEyoRDhx9b6gPeMIC').setData({
    'titulo': 'Ondas de calor em São Paulo Alterado',
    'idade': 'texto exemplo',
  });*/

  //db.collection('usuarios').document('003').delete();

  /*DocumentSnapshot snapshot =
      await db.collection('usuarios').document('002').get();

  var dados = snapshot.data;
  print('dados: ${dados['nome']}' + ' / idade: ${dados['idade']}');*/

  //QuerySnapshot querySnapshot = await db.collection('usuarios').getDocuments();

  //print('dados usuarios: ${querySnapshot.documents.toString()}');
  /*
  for (DocumentSnapshot item in querySnapshot.documents) {
    var dados = item.data;
    print('dados usuarios: ${dados['nome']} - ${dados['idade']}');
  }*/

  //ESTE COMANDO FAZ COM QUE O BANCO 'AVISE' QUANDO FOR INCLUÍDO ALGO NOVO
  //ATUALIZANDO ENTÃO A LISTA DO APLICATIVO
  /*db.collection('usuarios').snapshots().listen((snapshot) {
    for (DocumentSnapshot item in snapshot.documents) {
      var dados = item.data;
      print('dados usuarios: ${dados['nome']} - ${dados['idade']}');
    }
  });
  //FILTROS
  QuerySnapshot querySnapshot = await db
      .collection('usuarios')
      //.where('nome', isEqualTo: 'teste')
      //.where('idade', isEqualTo: 25)
      //.where('idade', isGreaterThan: 15)
      //.where('idade', isLessThan: 35)
      //.orderBy('idade', descending: true)
      //.orderBy('nome', descending: false)
      //.limit(2)
      .where('nome', arrayContains: 'ig')
      .getDocuments();

  for (DocumentSnapshot item in querySnapshot.documents) {
    var dados = item.data;
    print('Filtro nome: ${dados['nome']} idade: ${dados['idade']}');
  }*/

  /* ****************************************************************** */
  /* *************************** AULA 154 + *************************** */
  /* ****************************************************************** */

  FirebaseAuth auth = FirebaseAuth.instance;

  /* CRIANDO USUÁRIO COM EMAIL E SENHA */

  String email = 'igor@gmail.com';
  String senha = '123456';

  auth
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((FirebaseUser) {
    print('novo usuário: sucesso! e-mail: ${FirebaseUser}');
  }).catchError((erro) {
    print('novo usuário: erro ${erro.toString()}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
