import 'package:flutter/material.dart';
import 'package:flutter_modular_app/Repository/PostUserDataRepo.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final title = TextEditingController();
  final name = TextEditingController();
  String email =  "sabilkaruvatt@gmail.com";
  String address = "ABC";
  String phone = "0000";
  String website = "alcovebuilders";
  String company = "Cabot";

  PostUserDataRepo postUserDataRepo;

  @override
  void initState() {
    postUserDataRepo = PostUserDataRepo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User form'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white70,
          child: Column(
            children: <Widget>[
//              TextField(
//                decoration: InputDecoration(
//                  border: OutlineInputBorder(),
//                  labelText: "Name",
//                ),
//                controller: name,
//              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "UserName",
                ),
                controller: title,
              ),
              SizedBox(height: 30,),
              Container(
                color: Colors.teal,
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    postUserDataRepo.makeRequest();
                  },
                  child: Text("OK"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
