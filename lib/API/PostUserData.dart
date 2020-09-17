import 'dart:convert';

import 'package:core/Networking/APIRequest.dart';
import 'package:core/Networking/HTTPMethode.dart';

class PostUserData extends APIRequest{


  @override
  get SuccessResponseType => "";

  @override
  String get baseUrl => "https://jsonplaceholder.typicode.com";

  @override
  ContentEncoding get contentEncoding => null;

  @override
  Map<String, String> get headers => {'Content-Type': 'application/json; charset=UTF-8'};

  @override
  HttpMethod get method => HttpMethod.POST;

  @override
  Map<String,dynamic> get parameters => null;

  @override
  String get resourceName => "/albums";

  @override
  // TODO: implement body
  Map<String,dynamic> get body =>
      {
    'title': "James",
  };

}