import 'dart:async';
import 'package:core/Models/Employee.dart';
import 'package:core/Models/Profile.dart';
import 'package:flutter_modular_app/Repository/EmployeeRepo.dart';
import 'package:core/Networking/Response.dart';
import 'package:flutter_modular_app/Repository/ProfileRepo.dart';


class ProfileBloc {
  ProfileRepo profileRepo ;
  StreamController _streamController;

  StreamSink<ResponseApi<Profile>> get employeeListSink =>
      _streamController.sink;

  Stream<ResponseApi<Profile>> get employeeListStream =>
      _streamController.stream;

  ProfileBloc() {
    _streamController = StreamController<ResponseApi<Profile>>();
    profileRepo = ProfileRepo();
    fetchClocloPhotosList();
  }

  fetchClocloPhotosList() async {
    employeeListSink.add(ResponseApi.loading("Loading data"));
    try {
      Profile data = await profileRepo.getData();
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