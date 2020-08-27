
import 'package:flutter/material.dart';
import 'package:flutter_modular_app/ui/home/home_page.dart';
import 'package:flutter_modular_app/Env.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setUpEnvironment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
