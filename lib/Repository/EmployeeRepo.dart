
import 'package:core/Models/Employee.dart';
import 'package:core/Networking/APIClient.dart';
import 'package:core/Networking/Environment.dart';
import 'package:flutter_modular_app/Repository/GetEmployeeData.dart';
import 'package:flutter_modular_app/SetUpEnvironment.dart';
import 'package:http/http.dart';

class EmployeeRepo {
  Client _client;
  GetEmployeeData _getEmployeeData;
  APIClient _apiClient;
  SetUpEnvironment setUpEnvironment;

  Future<List<Data>> makeRequest() async {
    _client = Client();
    _getEmployeeData = GetEmployeeData();
    _apiClient = APIClient(_client);
    setUpEnvironment = SetUpEnvironment();

    final serverResponse = await _apiClient.request(service: _getEmployeeData, environment:setUpEnvironment );
    print(serverResponse);
    return Employer.fromJson(serverResponse).data;
  }
}
