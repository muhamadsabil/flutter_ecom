//
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:core/Networking/HTTPMethode.dart';
import 'package:core/Networking/Environment.dart';

enum ContentEncoding { url, json }
abstract class APIRequest {
      dynamic get SuccessResponseType;
      String get baseUrl;
      String get resourceName;
      HttpMethod get method;
      Map<String, String> get headers;
      Map<String, dynamic> get parameters;
      ContentEncoding get contentEncoding;

      String get queryParameters {
            if (method == HttpMethod.GET && parameters != null) {
                  final jsonString = Uri(queryParameters: parameters);
                  return '?${jsonString.query}';
            }
            return '';
      }

}
//extension on APIRequest{
//      Uri _baseUrl(){
//            var url = Uri.parse(baseUrl);
//            return url;
//      }
//}


