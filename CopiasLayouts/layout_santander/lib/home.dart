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
        backgroundColor: const Color(0xFFDE3E33),
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
            height: 110,
            color: const Color(0xFFDE3E33),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(children: const [
                      Text(
                        'Olá, hugão',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ]),
                    const SizedBox(height: 10),
                    Row(children: const [
                      Text(
                        'Ag 4321',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'CC 654321-0',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ]),
                  ],
                ),
              ),
            ]),
          ),
          const SizedBox(height: 70),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(width: 8)),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 140,
            color: Colors.white,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 10),
                      const Text(
                        'Saldo disponível',
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
                  ),
                  const Icon(Icons.keyboard_arrow_up, size: 30)
                ],
              )
            ]),
          )
        ],
      )),
    );
  }
}
