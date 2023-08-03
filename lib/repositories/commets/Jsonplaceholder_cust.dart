import 'package:dio/dio.dart';

class JsonPlaceholderCustonDio {
  final _dio = Dio();
  Dio get dio => _dio;
  JsonPlaceholderCustonDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }
}
