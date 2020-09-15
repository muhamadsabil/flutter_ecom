import 'dart:io';

import 'package:core/Networking/APIRequest.dart';
import 'package:core/Networking/Environment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:core/Networking/CustomExceptions.dart';
import 'package:core/Networking/HttpRequest.dart';
import 'package:http/http.dart';

//abstract class HttpSessionProtocol<T> {
//  Future<T> request({APIRequest service, Environment environment});
//}

class APIClient {
  @override
  final Client _client;
  APIClient(this._client);

  Future<dynamic> request({service,environment}) async {
    final request = HttpRequest(service, environment);
    var responseJson;
    try {
      final response = await http.get(request.url);

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('--- No Internet connection---');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) async {

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
