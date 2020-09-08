import 'package:flutter/material.dart';
import 'package:flutter_modular_app/ReusableCard.dart';
import 'package:flutter_modular_app/ui/home/EmployeesDiary.dart';
import 'package:flutter_modular_app/ui/home/EmployeesList.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api components"),
      ),
      body:Center(
        child: Container(
          height: 50,
          width: 100,
          color: Colors.teal,
          child: MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> EmployeeList()));
            },
            child: Text('Click me'),
          ),
        ),
      )
    );
  }
}
//Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
