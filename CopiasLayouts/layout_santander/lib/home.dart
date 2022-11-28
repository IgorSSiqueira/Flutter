import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1453A),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.menu, size: 25),
              const SizedBox(width: 20),
              const Text(
                'Santader',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.4),
              const Icon(Icons.chat_bubble_outlined, size: 25),
              const SizedBox(width: 15),
              const Icon(Icons.notifications_none, size: 25),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 125,
            color: Color(0xFFE1453A),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 0),
                    Row(children: [
                      Text(
                        'Olá, hugão',
                        style: TextStyle(fontSize: 20),
                      )
                    ]),
                    SizedBox(height: 10),
                    Row()
                  ],
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
