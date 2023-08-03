import '../models/Post_Model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
