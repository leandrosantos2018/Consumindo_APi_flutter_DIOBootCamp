import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JsonPlaceholderCustonDio {
  final _dio = Dio();

  Dio get dio => _dio;

  JsonPlaceholderCustonDio() {
    var urlbase = dotenv.get('urlBas', fallback: 'sana-dafault');
     _dio.options.baseUrl = urlbase;
  }
}
