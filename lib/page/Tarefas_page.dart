import 'package:busca_cep/models/tarefas_back4app_model.dart';
import 'package:busca_cep/repositories/back4app/tarefas_back4app_repository.dart';
import 'package:flutter/material.dart';

class TarefasPage extends StatefulWidget {
  TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  TerefaBack4AppREpository tarefasRepository = TerefaBack4AppREpository();
  var _tarefas = TarefasBack4AppModel([]);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  carregarDados() async {
    _tarefas = await tarefasRepository.obterTarefas() as TarefasBack4AppModel;
    print(_tarefas.tarefas.toList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo"),
        ),
        body: ListView.builder(
            itemCount: _tarefas.tarefas.length,
            itemBuilder: (_, index) {
              var postagem = _tarefas.tarefas[index];
              setState(() {});
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: InkWell(
                  onTap: () {
                    print(postagem.objectId);
                  },
                  child: Card(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postagem.descricao,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(postagem.concluindo.toString()),
                    ],
                  )),
                ),
              );
            }));
  }
}
