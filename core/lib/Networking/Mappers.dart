import 'dart:async';
import 'dart:convert';
import 'package:core/Models/Employee.dart';

import 'APiResponse.dart';
abstract class Mapable {

  factory Mapable(String data) {
      final response = json.decode(data);
      return Employer.fromJson(response);
  }
}

abstract class ListMapable<T> implements Mapable {
  Mapable fromJsonList(List<dynamic> json);
}
