import 'package:core/Models/Employee.dart';
import 'package:core/Models/Profile.dart';
import 'package:core/Networking/APIRequest.dart';
import 'package:core/Networking/HTTPMethode.dart';

class GetEmployeeData extends APIRequest {

  @override
  String get baseUrl => '/api/v1/employees';

  @override
  ContentEncoding get contentEncoding => ContentEncoding.url;

  @override
  Map<String, String> get headers => {
    "content-type": "application/x-www-form-urlencoded",
    "accept": "application/json",
  };

  @override
  HttpMethod get method => HttpMethod.GET;

  @override
  Map<String, dynamic> get parameters => null;

  @override
  String get path => '/posts';

  @override
  get SuccessResponseType => Employer;

  @override
  String get resourceName => "";


}