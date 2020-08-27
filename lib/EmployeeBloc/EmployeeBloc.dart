
import 'dart:async';
import 'package:core/Networking/APiResponse.dart';
import 'package:core/Models/Employee.dart';
import 'package:core/Repository/EmployeeRepo.dart';

class EmployeeBloc{
  EmployerResultRepo employerResultRepo;
  StreamController _streamController;
  StreamSink<ApiResponse<List<Data>>> get employeesSinkList => _streamController.sink;
  Stream<ApiResponse<List<Data>>> get employeesStreamList => _streamController.stream;

  EmployeeBloc() {
    employerResultRepo = EmployerResultRepo();
    _streamController = StreamController<ApiResponse<List<Data>>>();
    fetchEmployeesData();
  }

  fetchEmployeesData() async{
    employeesSinkList.add(ApiResponse.loading("fetching employees data"));
    try {
      List<Data> employer = await employerResultRepo.getEmployerResultRepo();
      employeesSinkList.add(ApiResponse.completed(employer));
    }catch (e) {
      employeesSinkList.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }
  dispose(){
    _streamController.close();
  }
}