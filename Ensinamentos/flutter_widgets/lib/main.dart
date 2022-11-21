import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ['igor', 'igor2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('widgets')),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: _lista.length,
                  itemBuilder: (context, index) {

                    return ListTile(
                      title: Text(_lista[index]),
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}
