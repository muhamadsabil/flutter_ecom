import 'dart:async';
import 'dart:convert';
import 'package:core/Models/Employee.dart';

import 'APiResponse.dart';
// Handler for the network's response.
abstract class Mapable {

  factory Mapable(Mapable type, String data) {
    if (type is BaseMapable) {
      Map<String, dynamic> mappingData = json.decode(data);
      return type.fromJson(mappingData);
    } else if (type is ListMapable) {
      final response = json.decode(data);
      return Employer.fromJson(response);
    }

    return null;
  }
}

abstract class BaseMapable<T> implements Mapable {
  Mapable fromJson(Map<String, dynamic> json);
}

abstract class ListMapable<T> implements Mapable {
  Mapable fromJsonList(List<dynamic> json);
}

// Handler for the network's error response.
abstract class ErrorMapable implements BaseMapable {
  String errorCode;
  String description;
}