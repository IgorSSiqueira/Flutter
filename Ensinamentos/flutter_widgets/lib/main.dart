import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
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
                    final item = _lista[index];

                    return Dismissible(
                        direction: DismissDirection.horizontal, // é o padrão
                        background: Container(
                          color: Colors.green,
                          padding: EdgeInsets.all(16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.edit, color: Colors.white)
                              ]),
                        ),
                        secondaryBackground: Container(
                          color: Colors.blue,
                          padding: EdgeInsets.all(16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.delete, color: Colors.white)
                              ]),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            print('Direção ${direction.toString()}');
                          } else if (direction == DismissDirection.startToEnd) {
                            print('Direção ${direction.toString()}');
                          }

                          setState(() {
                            _lista.remove(index);
                          });
                        },
                        key: Key(item),
                        child: ListTile(
                          title: Text(_lista[index]),
                        ));

                    return ListTile(
                      title: Text(_lista[index]),
                    );
                  }))
        ],
      ),
    );
  }
}
