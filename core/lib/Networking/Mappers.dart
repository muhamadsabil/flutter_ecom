import 'dart:convert';
import 'package:core/Models/Employee.dart';

import 'APiResponse.dart';

abstract class Mapable {
  static getData(String data) {
    final response = json.decode(data);
    return Employer.fromJson(response);
  }
}
