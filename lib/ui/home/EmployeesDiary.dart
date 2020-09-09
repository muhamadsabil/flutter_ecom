
import 'dart:async';

import 'package:core/Networking/APIClient.dart';
import 'package:flutter/material.dart';
import 'package:core/Models/Employee.dart';
import 'package:http/http.dart';
import 'package:core/Repository/EmployeeRepo.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  StreamController _streamController;


  Stream<List<Data>> get employeesStreamList => _streamController.stream;

  EmployeeRepo _employeeRepo;
//  void _makeRequest() async {
//    // Initialize the HttpClient.
//    final client = Client();
//    final postService = GetEmployeeData();
//    // Create an instance of the server session.
//    final session = APIClient();
//    final serverResponse =
//    await session.request(service: postService);
//  }

  @override
  void initState() {
    super.initState();
    _employeeRepo = EmployeeRepo();
    _streamController = StreamController<List<Data>>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fooo'),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text('Tap me'),
                  color: Colors.white70,
                  textColor: Colors.teal,
                  onPressed: (){
                    _employeeRepo.makeRequest();
                  },
                ),
                StreamBuilder(
                  stream: employeesStreamList,
                  builder: (BuildContext cntxt, AsyncSnapshot snapshot){
                    if(snapshot.data == null){
                      return Text('No data to show');
                    }
                    print(snapshot.data);
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext cntxt, int index){
                            return ListTile(
                              leading: Text(snapshot.data[index].employeeName.toString()),
                            );
                        }
                    );

                  }
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


