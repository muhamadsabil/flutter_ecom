import 'dart:io';
import 'package:core/Networking/APIRequest.dart';
import 'package:core/Networking/Environment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:core/Networking/CustomExceptions.dart';
import 'package:core/Networking/HttpRequest.dart';
import 'package:http/http.dart';

class APIClient {
  @override
  final Client _client;
  APIClient(this._client);

  Future<dynamic> request({APIRequest service, environment}) async {
    final request = HttpRequest(service, environment);
    var responseJson;
    switch (service.method.value) {
      case "POST":
        final response = await http.post(request.url, headers: request.headers, body: request.body);
        responseJson = _response(response);
        return responseJson;
      case "GET":
        final response = await http.get(request.url,headers: request.headers);
        responseJson = _response(response);
        return responseJson;
      case "DELETE":
        return responseJson;
      default:
        throw FetchDataException('---- No Internet connection---');
    }
  }
}

dynamic _response(response) async {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;

    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:

    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
