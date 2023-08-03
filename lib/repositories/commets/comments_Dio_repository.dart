import 'package:busca_cep/models/Commt_model.dart';
import 'package:busca_cep/repositories/commets/Jsonplaceholder_cust.dart';
import 'package:busca_cep/repositories/commets/comments_repository.dart';
import 'package:dio/dio.dart';

abstract class CommentsDioRepository implements CommentsRepository {
  @override
  // ignore: non_constant_identifier_names
  Future<List<CommtModel>> getCommmets(int PostId) async {
    var jsonPlaceholderCustonDio = JsonPlaceholderCustonDio();
    var response =
        await jsonPlaceholderCustonDio.dio.get("/posts/$PostId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommtModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
