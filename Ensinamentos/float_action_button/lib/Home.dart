import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FloatingActionButto')),

      body: Text('Conteúdo'),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        icon: Icon(Icons.add_shopping_cart),
        label: Text('Adicionar'),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),

        // child: Icon(Icons.add),
        onPressed: (){
          print('Resultado aosidjioasd');
        },
      ),

      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
