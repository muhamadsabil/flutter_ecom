import 'dart:convert';
import 'package:core/Models/Employee.dart';
import 'package:core/Models/Profile.dart';


abstract class Mapable {
  static getData(String data) {
    final response = json.decode(data);
    print(data.length);
    return Employer.fromJson(response);
  }
}
