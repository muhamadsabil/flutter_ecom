

import 'dart:async';

import 'package:core/Networking/APiResponse.dart';
import 'package:core/Networking/Mappers.dart';

class Employer extends ListMapable {
  String status;
  List<Data> data;

  Employer({this.status, this.data});

  Employer.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  Mapable fromJsonList(List json) {
    data = json.map((i) => Data.fromJson(i)).toList();
    return this;
  }

  @override
  // TODO: implement employeesStreamList
  Stream<List<Data>> get employeesStreamList => throw UnimplementedError();

}

class Data {
  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  Data(
      {this.id,
        this.employeeName,
        this.employeeSalary,
        this.employeeAge,
        this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    employeeName = json['employee_name'];
    employeeSalary = json['employee_salary'];
    employeeAge = json['employee_age'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_name'] = this.employeeName;
    data['employee_salary'] = this.employeeSalary;
    data['employee_age'] = this.employeeAge;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

