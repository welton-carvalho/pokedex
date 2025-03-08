import 'package:dio/dio.dart';

class HttpConfig {
  static final HttpConfig _instance = HttpConfig._();
  Dio client = Dio();
  HttpConfig._() {
    client.options.baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
    client.options.connectTimeout = Duration(seconds: 60);
    client.options.receiveTimeout = Duration(seconds: 60);
  }
  static HttpConfig get instance {
    return _instance;
  }
}
