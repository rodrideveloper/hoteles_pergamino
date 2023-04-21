import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ClientHttp {
  static const int time = 20;

  Future<http.Response> get(String baseUrl, String endPoint,
      [Map<String, String> queryParameters = const {}]) async {
    //_log(baseUrl, endPoint, page);

    var uri = Uri.https(baseUrl, endPoint, queryParameters);
    http.Response response;

    try {
      response = await http.get(uri).timeout(const Duration(seconds: time));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conexión a internet');
    } on TimeoutException {
      throw ApiNotRespondingException('API no responde');
    }
  }

  Future<http.Response> post(String baseUrl, String endPoint, Map body) async {
    var uri = Uri.https(baseUrl, endPoint);
    http.Response response;

    try {
      response = await http
          .post(uri, body: body)
          .timeout(const Duration(seconds: time));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conexión a internet');
    } on TimeoutException {
      throw ApiNotRespondingException('API no responde');
    }
  }

  void _log(String baseUrl, String endPoint, int page) {
    print('===== REST API=====');
    print('Main Url : $baseUrl');
    print('End Point: $endPoint');
    print('Page:$page');
    print('===================');
  }

  http.Response _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
        throw BadRequestException('Intente más tarde');
      case 401:
      case 403:
        throw UnAuthorizedException('Acceso no autorizado');
      case 422:
        throw BadRequestException('Intente más tarde');
      case 500:
      default:
        throw FetchDataException('Ocurrio un error');
    }
  }
}
