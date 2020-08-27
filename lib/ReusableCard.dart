
import 'package:flutter/material.dart';

class ReusableComponents extends StatelessWidget {
  final String screenTitle;
  final IconData iconData;
  final String tileTitle;
  final String tileSubTitle;
  final Function cancelButtonAction;
  final Function proceedButtonAction;

  ReusableComponents({
    @required this.iconData,
    @required this.tileSubTitle,
    @required this.tileTitle,
    @required this.cancelButtonAction,
    @required this.proceedButtonAction,
    @required this.screenTitle,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                  iconData),
              title: Text(tileTitle,style: TextStyle(
                color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold
              ),),
              subtitle: Text(tileSubTitle),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: cancelButtonAction,
                  ),
                  FlatButton(
                    child: Text('Proceed'),
                    onPressed: proceedButtonAction,
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
