import 'dart:convert';

import 'package:busca_cep/models/Commt_model.dart';
import 'package:busca_cep/repositories/commets/comments_repository.dart';
import 'package:http/http.dart' as http;

class CommetsHttpRepository implements CommentsRepository {
  @override
  Future<List<CommtModel>> getCommmets(int PostId) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$PostId/comments'));
    if (response.statusCode == 200) {
      var Commts = jsonDecode(response.body);
      return (Commts as List).map((e) => CommtModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
