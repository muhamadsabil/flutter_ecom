
import 'package:core/Networking/Environment.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:core/Networking/APIRequest.dart';


class HttpRequest extends Request  {

  final APIRequest service;
  final Environment environment;

  HttpRequest(this.service,this.environment) :
        super(service.method.value,Uri.parse('${environment.baseUrlString}${service.baseUrl}${service.resourceName}',));

  @override
  Map<String, String> get headers => this.service.headers;

  @override
  get body => null;

  @override
  Uint8List get bodyBytes {
    if (service.parameters == null) {
      return new Uint8List(0);
    }

    if (service.contentEncoding == ContentEncoding.url) {
      final queryParameters = Uri(queryParameters: service.parameters);
      List<int> bodyBytes = utf8.encode(queryParameters.query);

      return bodyBytes;
    } else {
      final encodedBody = Utf8Codec().encode(body);
      return Uint8List.fromList(encodedBody);
    }
  }

  @override
  MediaType get _contentType {
    var contentType = headers['content-type'];
    if (contentType == null) return null;
    return new MediaType.parse(contentType);
  }

}
