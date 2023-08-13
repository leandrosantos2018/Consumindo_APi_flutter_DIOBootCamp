import 'dart:convert';

import 'package:busca_cep/models/viacep_model.dart';
import 'package:busca_cep/repositories/posts/impl/via_cep_repository.dart';
import 'package:flutter/material.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: "");
  bool loanding = false;
  var viaCEPRepository = ViaCEpRepository();
  var viacepModel = ViaCEPModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Buscar CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           const SizedBox(
              height: 25,
            ),
          const  Text(
              'Consulta de CEP',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
                controller: cepController,
                // maxLength: 8,
                keyboardType: TextInputType.number,
                onChanged: (String value) async {
                  var cep = value.trim().replaceAll("-", "");
                  // var cep = value.replaceAll(new RegExp(r'[^0-9]'), '');
                  print(cep);

                  if (value.length >= 8) {
                    setState(() {
                      loanding = true;
                    });
                    viacepModel = (await viaCEPRepository.consultaCEP(cep))!;
                  }
                  setState(() {
                    loanding = false;
                  });
                }),
            SizedBox(
              height: 50,
            ),
            Text(
              viacepModel.logradouro ?? "",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}',
              style: TextStyle(fontSize: 22),
            ),
            Visibility(visible: loanding, child: CircularProgressIndicator())
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    ));
  }
}
