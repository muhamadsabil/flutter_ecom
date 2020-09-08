////
//import 'dart:async';
//import 'package:core/Networking/APIClient.dart';
//import 'package:core/Networking/APiResponse.dart';
//import 'package:core/Models/Employee.dart';
//import 'package:core/Repository/APIClient.dart';
//import 'package:core/Repository/GetEmployeeData.dart';
//import 'package:http/http.dart';
//
//class EmployeeBloc {
//
//  void _makeRequest() async {
//    // Initialize the HttpClient.
//    final client = Client();
//    final postService = GetEmployeeData();
//    // Create an instance of the server session.
//    final session = APIClient(client);
//    // Define the response type for the request.
//    final employeeList = Employer();
//
//    final serverResponse =
//    await session.request(service: postService, responseType: employeeList);
//  }
//
//  S
//}
//
