import 'dart:convert';

import 'package:busca_cep/models/viacep_model.dart';
import 'package:http/http.dart' as http;
import 'package:busca_cep/models/viacep_model.dart';

class ViaCEpRepository {
  var viacepmodel = ViaCEPModel();

  Future<ViaCEPModel?> consultaCEP(String cep) async {
    var response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return viacepmodel = ViaCEPModel.fromJson(json);
    }
    return ViaCEPModel();
  }
}
