
import 'dart:async';

import 'package:core/Networking/APIClient.dart';
import 'package:flutter/material.dart';
import 'package:core/Models/Employee.dart';
import 'package:http/http.dart';
import 'package:core/Repository/GetEmployeeData.dart';

class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  String _jsonString = "";
  String _finalString = '{}';

  StreamController _streamController;
  Stream<List<Data>> get employeesStreamList => _streamController.stream;

  void _makeRequest() async {
    // Initialize the HttpClient.
    final client = Client();
    final postService = GetEmployeeData();
    // Create an instance of the server session.
    final session = APIClient(client);
    // Define the response type for the request.
    final employeeList = Employer();

    final serverResponse =
    await session.request(service: postService);

    if(employeeList == null){
      _streamController.add(null);
    }
    _streamController.add(employeeList);

  }


  @override
  void initState() {
    super.initState();
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
                    _makeRequest();
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


