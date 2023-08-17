import 'dart:convert';
import 'package:convert/convert.dart';

import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../models/marvel_characters.dart';

class MarvelRepository {
  Future<marvel_characters> getCaharactres() async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var apikeyPrivate = "7f4f9229f5c73580bc71769129de1fc8818ee125";

    var apikeypublic = "3c194e2abbbe905cbd079ed7cb09821b";
    var hash = generateMd5(ts + apikeypublic + apikeyPrivate);

    var query = "ts=$ts&apikey=$apikeypublic&hash=$hash";

    var result =
        await dio.get('https://gateway.marvel.com/v1/public/characters?$query');

    var Marvel_characters = marvel_characters.fromJson(result.data);

    return Marvel_characters;
  }

  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
