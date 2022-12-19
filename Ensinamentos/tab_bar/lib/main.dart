import 'package:flutter/material.dart';
import 'package:tab_bar/primeira_pagina.dart';
import 'package:tab_bar/segunda_pagina.dart';
import 'package:tab_bar/terceira_pagina.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abas'),
        // ignore: prefer_const_literals_to_create_immutables
        bottom: TabBar(controller: _tabController, tabs: [
          const Tab(
            text: 'Home',
            icon: Icon(Icons.home),
          ),
          const Tab(
            text: 'E-mail',
            icon: Icon(Icons.email),
          ),
          const Tab(
            text: 'Conta',
            icon: Icon(Icons.account_circle),
          ),
        ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        PrimeiraPagina(),
        SegundaPagina(),
        TerceiraPagina(),
      ]),
    );
  }
}
