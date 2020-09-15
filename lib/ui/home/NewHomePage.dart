import 'package:core/Models/Employee.dart';
import 'package:core/Models/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_app/Bloc/EmployeeBloc.dart';
import 'package:flutter_modular_app/Bloc/ProfileBloc.dart';
import 'package:flutter_modular_app/SetUpEnvironment.dart';
import 'package:http/http.dart';
import 'package:core/Networking/Response.dart';

class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {

  EmployeeBloc _employeeBlock;
  ProfileBloc profileBloc;

  @override
  void initState() {
//    profileBloc = ProfileBloc();
    _employeeBlock = EmployeeBloc();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewHome'),
      ),
      body: RefreshIndicator(
//        onRefresh:()=> profileBloc.fetchClocloPhotosList(),
        onRefresh:()=> _employeeBlock.fetchClocloPhotosList(),
//        child: StreamBuilder<ResponseApi<Profile>>(
    child: StreamBuilder<ResponseApi<List<Data>>>(

//            stream: profileBloc.employeeListStream,
            stream: _employeeBlock.employeeListStream,

            builder: (context,snapshot){
              if(snapshot.hasData){
                switch (snapshot.data.status){
                  case Status.LOADING:
                    return Loading(loadingMessage: snapshot.data.message);
                    break;
                  case Status.COMPLETED:
                    return EmployeeHome(store: snapshot.data.data,);
                    break;
                  case Status.ERROR:
                    return Error(errorMessage: snapshot.data.message,);
                    break;
                }

              }
              return Container();
            }
            ),
      ),
    );
  }
}

class EmployeeHome extends StatefulWidget {
  final List<Data> store;
// final Profile jsonRespons;

  const EmployeeHome({Key key, this.store}) : super(key: key);

//  const EmployeeHome({Key key, this.jsonRespons}) : super(key: key);
  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView.builder(
       itemCount: widget.store.length,
       itemBuilder: (context, index){
         return ListTile(
           leading: Text(widget.store[index].employeeName),
           trailing:Text(widget.store[index].employeeName),
         );
       },

     ),
    );
  }
}



class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
          ),
        ],
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;


  const Error({Key key, this.errorMessage})
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
//            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}