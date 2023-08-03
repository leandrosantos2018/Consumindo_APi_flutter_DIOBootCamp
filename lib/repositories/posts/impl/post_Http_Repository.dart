import 'dart:convert';

import 'package:busca_cep/models/Post_Model.dart';
import 'package:http/http.dart' as http;

import '../../posts_Repository.dart';



class PostshttpRepository implements PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var posts = jsonDecode(response.body);
      return (posts as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
