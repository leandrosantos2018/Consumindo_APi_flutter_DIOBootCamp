import 'dart:convert';

import 'package:busca_cep/models/Post_Model.dart';
import 'package:busca_cep/repositories/commets/Jsonplaceholder_cust.dart';
import '../../posts_Repository.dart';
import 'package:dio/dio.dart';

class PostsDioRepository implements PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceholderCustonDio = JsonPlaceholderCustonDio();
    var response = await jsonPlaceholderCustonDio.dio.get("/posts/");

    if (response.statusCode == 200) {
      // var posts = jsonDecode();
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
