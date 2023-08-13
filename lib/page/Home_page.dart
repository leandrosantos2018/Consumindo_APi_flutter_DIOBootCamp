import 'package:busca_cep/models/marvel_characters.dart';
import 'package:busca_cep/page/Consulta_CEP.dart';
import 'package:busca_cep/page/Post_page.dart';
import 'package:flutter/material.dart';

import '../repositories/marvel/marve_api_reporitory.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Consumindo API"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: null, accountEmail: null),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ConsultaCEP()));
                },
                child: const Text(
                  "Bucar CEP",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => PostsPage()));
                },
                child: const Text(
                  "Post",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                )),
            InkWell(
                onTap: () async {
                  var marvelrepository = MarcvelRepository();
                  var heros = await marvelrepository.getCaharactres();
                  print(heros);
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => PostsPage()));
                },
                child: const Text(
                  "Herois",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                )),
          ],
        ),
      ),
      body: Container(
          child: const Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "App Praticando consumo de api com pacote HTTP e DIO",
            style: TextStyle(fontSize: 26),
          ),
        ),
      )),
    ));
  }
}
