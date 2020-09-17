import 'package:core/Models/Employee.dart';
import 'package:core/Models/Profile.dart';
import 'package:core/Networking/APIRequest.dart';
import 'package:core/Networking/HTTPMethode.dart';

class GetPostmanData extends APIRequest {

  @override
  String get baseUrl =>  'https://postman-echo.com';

  @override
  ContentEncoding get contentEncoding => ContentEncoding.url;

  @override
  Map<String, String> get headers => {
//    "content-type": "application/x-www-form-urlencoded",
//    "accept": "application/json",
  "Authorization": "Basic cG9zdG1hbjpwYXNzd29yZA=="
  };

  @override
  HttpMethod get method => HttpMethod.GET;

  @override
  Map<String, dynamic> get parameters => null;

  @override
  String get path => '/get?foo1=bar1&foo2=bar2';

  @override
  get SuccessResponseType => Employer;

  @override
  String get resourceName => '/basic-auth';

  @override
  // TODO: implement body
  get body => null;


}