
import 'package:core/Models/Employee.dart';
import 'package:flutter/material.dart';
import 'package:core/Networking/APIResponse.dart';
import 'package:flutter_modular_app/ui/LoadingView/LoadingView.dart';
import 'package:flutter_modular_app/EmployeeBloc/EmployeeBloc.dart';
class NewHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  EmployeeBlock _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = EmployeeBlock();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Home'),
      ),

        body: StreamBuilder<ApiResponse<Data>>(
          stream: _bloc.getEmployeeData(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              switch (snapShot.data.status) {
                case Status.LOADING:
                  return Loading(
                    loadingMessage: snapShot.data.message,
                  );
                case Status.COMPLETED:
                  return EmployeeHome(details: snapShot.data.data);
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapShot.data.message,
                  );
              }
            }
            return Container();
          },
        )
    );
  }
}

class EmployeeHome extends StatefulWidget {
  final details;

  const EmployeeHome({Key key, this.details}) : super(key: key);

  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Text(widget.details),
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.lightGreen,
            child: Text('Retry', style: TextStyle(color: Colors.white)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}

