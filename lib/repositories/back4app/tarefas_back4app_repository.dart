import 'dart:convert';

import 'package:busca_cep/models/tarefas_back4app_model.dart';
import 'package:dio/dio.dart';

class TerefaBack4AppREpository {
  var _dio = Dio();

  TerefaBack4AppREpository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<Object> obterTarefas() async {
 
    var result = await _dio.get("/Tarefas");

    if (result.statusCode == 200) {
      var tarefa = jsonDecode(result.data);
      return (tarefa as List)
          .map((e) => TarefaBack4AppModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
