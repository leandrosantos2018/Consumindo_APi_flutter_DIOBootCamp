import 'package:busca_cep/models/Commt_model.dart';

abstract class CommentsRepository {
  Future<List<CommtModel>> getCommmets(int PostId);
}
