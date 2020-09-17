import 'package:core/Networking/APIRequest.dart';
import 'package:core/Networking/HTTPMethode.dart';
import 'package:core/Models/Profile.dart';

class GetProfileData extends APIRequest{
  @override
  // TODO: implement SuccessResponseType
  get SuccessResponseType => Foo;

  @override
  // TODO: implement baseUrl
  String get baseUrl => "https://jsonplaceholder.typicode.com/";

  @override
  // TODO: implement contentEncoding
  ContentEncoding get contentEncoding => ContentEncoding.url;

  @override
  // TODO: implement headers
  Map<String, String> get headers => {
    "content-type": "application/x-www-form-urlencoded",
    "accept": "application/json",
  };

  @override
  // TODO: implement method
  HttpMethod get method => HttpMethod.GET;

  @override
  // TODO: implement parameters
  Map<String,dynamic > get parameters => null;

  @override
  // TODO: implement resourceName
  String get resourceName => "posts";

  @override
  // TODO: implement body
  get body => null;

}