import 'dart:convert';

import 'package:core/Models/Employee.dart';
import 'package:core/Models/Profile.dart';

import 'package:core/Networking/APIClient.dart';
import 'package:flutter_modular_app/API/GetProfileData.dart';
import 'package:http/http.dart';

class ProfileRepo {
  Client _client;
  GetProfileData _getEmployeeData;
  APIClient _apiClient;
  Future <Foo> getData() async {
    _client = Client();
    _getEmployeeData = GetProfileData();
    _apiClient = APIClient(_client);
    final serverResponse = await _apiClient.request(service: _getEmployeeData);
    print(serverResponse);
    return Foo.fromJson(serverResponse[0]);
  }
}
