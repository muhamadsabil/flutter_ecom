
import 'dart:convert';

import 'package:core/Models/Employee.dart';
import 'package:core/Networking/APIClient.dart';
import 'package:core/Repository/GetEmployeeData.dart';
import 'package:http/http.dart';

class EmployeeRepo{
    Client _client;
    GetEmployeeData _getEmployeeData;
    APIClient _apiClient;
   Future<Employer> makeRequest()async {
      _getEmployeeData = GetEmployeeData();
      _apiClient = APIClient(_client);
      _client = Client();
      final serverResponse = await _apiClient.request(service: _getEmployeeData);
      return Employer.fromJson(serverResponse);
    }


}