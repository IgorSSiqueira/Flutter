import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Olá, CLIENTE',
                  style: TextStyle(color: Color(0xFF1DA87E), fontSize: 20),
                ),
                SizedBox(width: 10),
                const Text(
                  '=)',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 190,
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF1DA87E),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('IBAGEM DO CARTÃO',
                          style: TextStyle(color: Colors.white))
                    ],
                  )),
                  //child: Image.asset('img/alelo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF1BBA38),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('IBAGEM DO CARTÃO',
                          style: TextStyle(color: Colors.white))
                    ],
                  )),
                  //child: Image.asset('img/alelo.png'),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
