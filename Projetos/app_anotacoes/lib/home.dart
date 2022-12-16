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

  _exibirTelaCadastro({Anotacao? anotacao}) {
    String textoSalvarAtualizar = '';
    if (anotacao == null) {
      //salvando
      _tituloController.text = '';
      _descricaoController.text = '';
      textoSalvarAtualizar = 'Salvar';
    } else {
      //atualizando
      _tituloController.text = anotacao.titulo!;
      _descricaoController.text = anotacao.descricao!;
      textoSalvarAtualizar = 'Atualizar';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$textoSalvarAtualizar anotação'),
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
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // salvar
                _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);

                Navigator.pop(context);
              },
              child: Text(textoSalvarAtualizar),
            )
          ],
        );
      },
    );
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

  _salvarAtualizarAnotacao({Anotacao? anotacaoSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    if (anotacaoSelecionada == null) {
      //salvando
      Anotacao anotacao =
          Anotacao(titulo, descricao, DateTime.now().toString());
      int resultado = await _db.salvarAnotacao(anotacao);
    } else {
      //atualizando
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = DateTime.now().toString();
      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    _tituloController.clear();
    _descricaoController.clear();

    _recuperarAnotacoes();
  }

  _formatarData(String? data) {
    initializeDateFormatting('pt_BR');

    //var formatador = DateFormat('d/MM/yy - H:m:s');
    var formatador = DateFormat.yMMMd('pt_BR');

    DateTime dataConvertida = DateTime.parse(data!);

    String dataFormatada = formatador.format(dataConvertida);

    return dataFormatada;
  }

  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);

    _recuperarAnotacoes();
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

                    print('${anotacao.data}');

                    return Card(
                      child: ListTile(
                        title: Text(anotacao.titulo!),
                        subtitle: Text(
                            '${_formatarData(anotacao.data)} - ${anotacao.descricao}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _exibirTelaCadastro(anotacao: anotacao);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _removerAnotacao(anotacao.id!);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 0),
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ))
                          ],
                        ),
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
