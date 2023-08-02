import 'package:busca_cep/models/Commt_model.dart';
import 'package:busca_cep/repositories/http/Commet_Http_Repository.dart';
import 'package:flutter/material.dart';

class CommetsPage extends StatefulWidget {
  final int? PostId;

  CommetsPage({super.key, required this.PostId});

  @override
  State<CommetsPage> createState() => _CommetsPageState();
}

class _CommetsPageState extends State<CommetsPage> {
  var CommtsRepository = CommetsHttpRepository();
  var commets = <CommtModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CarregarDados();
  }

  CarregarDados() async {
    commets = await CommtsRepository.getCommmets(widget.PostId!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("comentarios do Post : ${widget.PostId!}")),
      body: Container(
        child: commets.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: commets.length,
                itemBuilder: (_, int index) {
                  var comment = commets[index];
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 21),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(comment.body!),
                        ],
                      ),
                    ),
                  ));
                }),
      ),
    ));
  }
}
