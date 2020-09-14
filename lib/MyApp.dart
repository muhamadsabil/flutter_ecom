
import 'package:flutter/material.dart';
import 'package:flutter_modular_app/ui/home/NewHomePage.dart';
import 'package:flutter_modular_app/Env.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewHomePage(),
    );
  }
}
