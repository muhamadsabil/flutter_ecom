import 'package:flutter/material.dart';
import 'package:flutter_modular_app/ReusableCard.dart';
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
        title: Text("Welcome ${widget.title}"),
      ),
      body:Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

          },
        ),
      )
    );
  }
}
//Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
