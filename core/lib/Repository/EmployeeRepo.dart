

import 'package:core/Models/Employee.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class EmployerResultRepo{

  Future<List<Data>> getEmployerResultRepo() async{
    final url = "http://dummy.restapiexample.com/api/v1/employees";
    final response = await http.get(url);
    if(response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      return Employer.fromJson(jsonResponse).data;
    } else {
      throw Exception("No Data ");
    }
  }
}