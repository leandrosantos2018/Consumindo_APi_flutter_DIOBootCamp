import 'package:busca_cep/models/tarefas_back4app_model.dart';
import 'package:dio/dio.dart';

class TerefaBack4AppREpository {
  Future<TarefasBack4AppModel> obterTarefas() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "QYBoJwnrzCyHfgqFFADzDHQLg8ZvXnNMTOEdrjcL";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "0Slrf24H0K4JnrQdBjlx0VzV5U3UUK5BnLRD1uh9";
    dio.options.headers["Content-Type"] = "application/json";
        var result = await dio.get("https://parseapi.back4app.com/classes/Tarefas");
    return TarefasBack4AppModel.fromJson(result.data);
  }
}
