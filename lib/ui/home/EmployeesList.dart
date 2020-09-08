//import 'package:flutter/material.dart';
//import 'package:core/Networking/APiResponse.dart';
//import 'package:flutter_modular_app/EmployeeBloc/EmployeeBloc.dart';
//import 'package:core/Models/Employee.dart';
//import 'package:flutter_modular_app/ui/ErrorView/ErrorView.dart';
//import 'package:flutter_modular_app/ui/LoadingView/LoadingView.dart';
//import 'package:flutter_modular_app/ReusableCard.dart';
//
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
////  EmployeeBloc employerBloc;
//
//  @override
//  void initState() {
//    super.initState();
////    employerBloc = EmployeeBloc();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return RefreshIndicator(
//      onRefresh: (){
////        employerBloc.fetchEmployeesData();
//        },
//      child: StreamBuilder<ApiResponse<List<Data>>>(
//        stream: employerBloc.employeesStreamList,
//        builder: (context, snapShot) {
//          if (snapShot.hasData) {
//            switch (snapShot.data.status) {
//              case Status.LOADING:
//                return Loading(
//                  loadingMessage: snapShot.data.message,
//                );
//                break;
//              case Status.COMPLETED:
//                return EmployeeList(employeeList: snapShot.data.data);
//                break;
//              case Status.ERROR:
//                return ErrorView(
//                  errorMessage: snapShot.data.message,
//                  onRetryPressed: () => employerBloc.fetchEmployeesData(),
//                );
//                break;
//            }
//          }
//          return CircularProgressIndicator();
//        },
//      ),
//    );
//  }
//}
//
//class EmployeeList extends StatefulWidget {
//  final List<Data> employeeList;
//  EmployeeList({this.employeeList});
//  @override
//  _EmployeeListState createState() => _EmployeeListState();
//}
//
//class _EmployeeListState extends State<EmployeeList> {
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemBuilder: (BuildContext context, int index) {
//        return Padding(
//          padding: const EdgeInsets.all(20.0),
//          child: ReusableComponents(
//            tileTitle: widget.employeeList[index].employeeName.toString(),
//            tileSubTitle: widget.employeeList[index].employeeSalary.toString(),
//            screenTitle: widget.employeeList[index].employeeAge.toString(),
//            cancelButtonAction: () {},
//            proceedButtonAction: () {},
//          ),
//        );
//      },
//      itemCount: widget.employeeList.length,
//    );
//  }
//}
