import 'dart:async';
import 'package:core/Models/Employee.dart';
import 'package:core/Models/Profile.dart';
import 'package:flutter_modular_app/Repository/EmployeeRepo.dart';
import 'package:core/Networking/Response.dart';
import 'package:flutter_modular_app/Repository/ProfileRepo.dart';


class FooBloc {
  ProfileRepo profileRepo ;
  StreamController _streamController;

  StreamSink<ResponseApi<Foo>> get employeeListSink =>
      _streamController.sink;

  Stream<ResponseApi<Foo>> get employeeListStream =>
      _streamController.stream;

  FooBloc() {
    _streamController = StreamController<ResponseApi<Foo>>();
    profileRepo = ProfileRepo();
    fetchClocloPhotosList();
  }

  fetchClocloPhotosList() async {
    employeeListSink.add(ResponseApi.loading("Loading data"));
    try {
      Foo data = await profileRepo.getData();
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

