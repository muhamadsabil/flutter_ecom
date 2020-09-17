
import 'package:flutter/material.dart';
import 'package:flutter_modular_app/SetUpEnvironment.dart';
import 'package:flutter_modular_app/ui/home/PostManHome.dart';
import 'package:flutter_modular_app/ui/home/NewHomePage.dart';
import 'package:flutter_modular_app/ui/home/UserForm.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  SetUpEnvironment setUpEnvironment;
  @override
  void initState() {
    setUpEnvironment = SetUpEnvironment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewHomePage(),
    );
  }
}

