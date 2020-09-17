
import 'package:core/Models/Postman.dart';
import 'package:core/Networking/APIClient.dart';
import 'package:core/Networking/Environment.dart';
import 'package:flutter_modular_app/API/GetPostmanData.dart';
import 'package:flutter_modular_app/SetUpEnvironment.dart';
import 'package:http/http.dart';

class PostmanDataRepo {
  Client _client;
  GetPostmanData _getEmployeeData;
  APIClient _apiClient;
  SetUpEnvironment setUpEnvironment;

  Future<SampleModal> makeRequest() async {
    _client = Client();
    _getEmployeeData = GetPostmanData();
    _apiClient = APIClient(_client);
    setUpEnvironment = SetUpEnvironment();

    final serverResponse = await _apiClient.request(service: _getEmployeeData, environment:setUpEnvironment );
    print(serverResponse);
    return SampleModal.fromJson(serverResponse);
  }
}
