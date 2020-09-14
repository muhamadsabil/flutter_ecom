import 'dart:async';
import 'package:core/Models/Employee.dart';
import 'package:flutter_modular_app/Repository/EmployeeRepo.dart';
import 'package:core/Networking/Response.dart';


class EmployeeBloc {
  EmployeeRepo _employeeRepository;
  StreamController _streamController;

  StreamSink<ResponseApi<List<Data>>> get employeeListSink =>
      _streamController.sink;

  Stream<ResponseApi<List<Data>>> get employeeListStream =>
      _streamController.stream;

  EmployeeBloc() {
    _streamController = StreamController<ResponseApi<List<Data>>>();
    _employeeRepository = EmployeeRepo();
    fetchClocloPhotosList();
  }

  fetchClocloPhotosList() async {
    employeeListSink.add(ResponseApi.loading("Loading data"));
    try {
      List<Data> data = await _employeeRepository.makeRequest();
      employeeListSink.add(ResponseApi.completed(data));
    } catch (e) {
      employeeListSink.add(ResponseApi.error(e.toString()));
      print(e);
    }
  }


  dispose() {
    _streamController?.close();
  }
}