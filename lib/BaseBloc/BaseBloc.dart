import 'dart:async';

import 'package:core/Networking/Response.dart';
import 'package:flutter_modular_app/Repository/EmployeeRepo.dart';
import 'package:http/http.dart';

class BaseBloc {
  EmployeeRepo _repository;
  StreamController _listController;
  dynamic _SuccessType;
  StreamSink<ResponseApi<dynamic>> get ListSink =>
  _listController.sink;

  Stream<ResponseApi<dynamic>> get itemListStream =>
  _listController.stream;

  dynamic parameters;


  Bloc(dynamic params,dynamic responseType) {

  _SuccessType = responseType;
  _listController = StreamController<ResponseApi<dynamic>>();
  _repository = EmployeeRepo();
  parameters = params;
  fetch(parameters,_SuccessType);
  }

  fetch(dynamic Params,dynamic responseType) async {

  _listController = StreamController<ResponseApi<dynamic>>();
  _repository = EmployeeRepo();
  parameters = Params;

  ListSink.add(ResponseApi.loading('Getting Data.'));
  try {
  var data =
  await _repository.makeRequest();
  ListSink.add(ResponseApi.completed(data));
  } catch (e) {
  ListSink.add(ResponseApi.error(e.toString()));
  print(e);
  }
  }

  dispose() {
  _listController?.close();
  }

}