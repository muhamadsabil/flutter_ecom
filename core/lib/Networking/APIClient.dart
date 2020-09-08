

import 'package:core/Networking/APIRequest.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:core/Networking/HttpRequest.dart';
import 'package:core/Networking/Mappers.dart';
import 'package:core/Networking/CustomExceptions.dart';

abstract class HttpSessionProtocol<T> {
  Future<Mapable> request({APIRequest service});
}

class APIClient implements HttpSessionProtocol {
  final Client _client;

  APIClient(this._client);
  @override
  Future<Mapable> request({APIRequest service}) async {
    final request = HttpRequest(service);
    final requestResponse = await _client.send(request);
    switch (requestResponse.statusCode) {
      case 200:
        final data = await requestResponse.stream.transform(utf8.decoder).join();
        return Mapable.getData(data);
      case 400:
        throw BadRequestException(requestResponse.toString());
      case 401:

      case 403:
        throw UnauthorisedException(requestResponse.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${requestResponse.statusCode}');
    }



  }
}
