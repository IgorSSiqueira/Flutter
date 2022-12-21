import 'package:aprenda_ingles/telas/bichos.dart';
import 'package:aprenda_ingles/telas/numeros.dart';
import 'package:aprenda_ingles/telas/vogais.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Aprenda inglês'),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          //labelColor: Colors.green,
          //unselectedLabelColor: Colors.purple,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Bichos'),
            Tab(text: 'Números'),
            Tab(text: 'Vogais'),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        Bichos(),
        Numeros(),
        Vogais(),
      ]),
    );
  }
}
