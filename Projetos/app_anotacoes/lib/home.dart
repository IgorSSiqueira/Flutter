import 'package:app_anotacoes/helper/anotacaoHelper.dart';
import 'package:app_anotacoes/model/anotacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final _db = AnotacaoHelper();
  List<Anotacao> _anotacoes = <Anotacao>[]; //List<Anotacao>();

  _exibirTelaCadastro() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('adicionar anotação'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              controller: _tituloController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Título',
                hintText: 'Digite título...',
              ),
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: 'Digite descrição...',
              ),
            ),
          ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // salvar
                _salvarAnotacao();

                Navigator.pop(context);
              },
              child: Text('Salvar'),
            )
          ],
        );
      },
    );
  }

  _salvarAnotacao() async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    //print('data atual: $DateTime.now()');
    Anotacao anotacao = Anotacao(titulo, descricao, 'teste');
    int resultado = await _db.salvarAnotacao(anotacao);

    _tituloController.clear();
    _descricaoController.clear();

    _recuperarAnotacoes();
  }

  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();

    List<Anotacao>? listaTemporaria = <Anotacao>[]; //List<Anotacao>();
    for (var item in anotacoesRecuperadas) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }

    setState(() {
      _anotacoes = listaTemporaria!;
    });
    listaTemporaria = null;

    print('Lista anotacoes: $anotacoesRecuperadas.toString()');
  }

  _formatarData(String? data) {
    initializeDateFormatting('pt_BR');

    var formatador = DateFormat('y/M/d');

    DateTime dataConvertida = DateTime.parse(data!);

    String dataFormatada = formatador.format(dataConvertida);

    return dataFormatada;
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas anotações'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _anotacoes.length,
                  itemBuilder: (context, index) {
                    final anotacao = _anotacoes[index];

                    return Card(
                      child: ListTile(
                        title: Text(anotacao.titulo!),
                        subtitle: Text(
                            '${_formatarData(anotacao.data)} - ${anotacao.descricao}'),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
