

import 'package:core/Networking/APIRequest.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:core/Networking/HttpRequest.dart';
import 'package:core/Networking/Mappers.dart';
import 'package:core/Networking/ErrorResponse.dart';
import 'package:core/Networking/CustomExceptions.dart';

abstract class HttpSessionProtocol<T> {
  Future<Mapable> request({APIRequest service, Mapable responseType});
}

class APIClient implements HttpSessionProtocol {
  final Client _client;

  APIClient(this._client);

  @override
  Future<Mapable> request({APIRequest service, Mapable responseType}) async {
    final request = HttpRequest(service);

    final requestResponse = await _client.send(request);
    if (requestResponse.statusCode >= 200 &&
        requestResponse.statusCode <= 299) {
      final data = await requestResponse.stream.transform(utf8.decoder).join();
      return Mapable(responseType, data);
    }

  }
}
