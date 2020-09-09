import 'dart:async';

import 'package:core/Models/Employee.dart';
import 'package:core/Networking/APIResponse.dart';
import 'package:core/Repository/EmployeeRepo.dart';



class EmployeeBlock {
  EmployeeRepo employeeRepo;

  StreamController _streamController;

  StreamSink<ApiResponse<Data>> get _sink =>
      _streamController.sink;

  Stream<ApiResponse<Data>> get _stream =>
      _streamController.stream;

  EmployeeBlock() {
    employeeRepo = EmployeeRepo();
    _streamController = StreamController<ApiResponse<Data>>();
  }

  getEmployeeData () async {
    _sink.add(ApiResponse.loading('Fetching employee details'));
    try {
      dynamic _data = await employeeRepo.makeRequest();
      _sink.add(ApiResponse.completed(_data));
    } catch (e) {
      _sink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _streamController?.close();
  }
}