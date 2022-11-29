import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  final PageController _controller2 = PageController(
    initialPage: 0,
  );

  final PageController _controller3 = PageController(
    initialPage: 0,
  );

  int _indexAtual = 0;

  Widget _paddingBox(int boxColor) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 100,
        color: Color(boxColor),
      ),
    );
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
              children: const [
                Text(
                  'Olá, CLIENTE',
                  style: TextStyle(color: Color(0xFF1DA87E), fontSize: 20),
                ),
                SizedBox(width: 10),
                Text(
                  '=)',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 5),
          SizedBox(
            height: 190,
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF1DA87E),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Alelo',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  )),
                  //child: Image.asset('img/alelo.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF1BBA38),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Alelo',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  )),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _controller,
            count: 2,
            effect: JumpingDotEffect(
              dotColor: Colors.grey.shade400,
              spacing: 4,
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(children: [
                  Row(children: const [
                    Icon(
                      Icons.store_mall_directory_rounded,
                      color: Color(0xFF1DA87E),
                    ),
                  ]),
                  const SizedBox(height: 6),
                  Row(children: const [
                    Text(
                      'Onde aceita',
                      style: TextStyle(fontSize: 14),
                    )
                  ]),
                ]),
              ),
              Container(
                child: Column(children: [
                  Row(children: const [
                    Icon(
                      Icons.sell,
                      color: Color(0xFF1DA87E),
                    ),
                  ]),
                  const SizedBox(height: 6),
                  Row(children: const [
                    Text(
                      'OFertas Exclusivas',
                      style: TextStyle(fontSize: 14),
                    )
                  ]),
                ]),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Descontos e Serviços',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            child: PageView(
              controller: _controller2,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: const BoxDecoration(
                    color: Color(0xFF06251C),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Banner',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  )),
                  //child: Image.asset('img/alelo.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: const BoxDecoration(
                    color: Color(0xFF041549),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Banner',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  )),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _controller2,
            count: 2,
            effect: JumpingDotEffect(
              dotColor: Colors.grey.shade400,
              spacing: 4,
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView(
              controller: _controller3,
              scrollDirection: Axis.horizontal,
              children: [
                _paddingBox(0xFF3E1E9D),
                _paddingBox(0xFF1E4E3E),
                _paddingBox(0xFF0F1A17),
                _paddingBox(0xFF822A43),
                _paddingBox(0xFF0A4A39),
                _paddingBox(0xFF7BC00C),
                _paddingBox(0xFF3E1E9D),
              ],
            ),
          ),
          SizedBox(height: 50)
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAtual,
        onTap: (index) {
          setState(() {
            _indexAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: 'Início', icon: Icon(Icons.home, color: Colors.black)),
          BottomNavigationBarItem(
              label: 'Início', icon: Icon(Icons.percent, color: Colors.black)),
          BottomNavigationBarItem(
              label: 'Início',
              icon: Icon(Icons.notifications_none, color: Colors.black)),
          BottomNavigationBarItem(
              label: 'Início',
              icon: Icon(Icons.person_outline, color: Colors.black)),
        ],
      ),
    );
  }
}
