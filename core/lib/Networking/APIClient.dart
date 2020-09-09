import 'dart:io';

import 'package:core/Models/Employee.dart';
import 'package:core/Networking/APIRequest.dart';
import 'package:core/Networking/APIResponse.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:core/Networking/HttpRequest.dart';
import 'package:core/Networking/Mappers.dart';
import 'package:core/Networking/CustomExceptions.dart';

abstract class HttpSessionProtocol<T> {
  Future<T> request({APIRequest service});
}

class APIClient implements HttpSessionProtocol {

  final http.Client _client;
  APIClient(this._client);
  @override
  Future<dynamic> request({APIRequest service}) async {
    var responseJson;
    try {
      final response = await http.get(service.baseUrl);
      responseJson = _response(response, service);
    } on SocketException {
      throw FetchDataException('--- No Internet connection---');
    }
    return responseJson;
  }

  dynamic _response(http.Response response, APIRequest service) {
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
