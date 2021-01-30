import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: Text('The app name goes here'),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blue,
      ),
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(25.0),
      padding: EdgeInsets.all(40.0),

      child: Container(
      child: RaisedButton(
        onPressed: () {
          print("top 5 has been pressed");
        },
        child: Container(
          child: Text('5 most talked about stocks'),
            color: Colors.blueAccent,
            alignment: Alignment.bottomLeft,
             margin: EdgeInsets.all(25.0),
             padding: EdgeInsets.all(40.0),
        ),
      ),
    );

     child: Container(
      child: RaisedButton(
        onPressed: () {
          print("search has been pressed");
        },
        child: Container(
          child: Text('search stock tickers'),
            color: Colors.blueAccent,
            alignment: Alignment.bottomright,
             margin: EdgeInsets.all(25.0),
             padding: EdgeInsets.all(40.0),
        ),
      ),
    );
    );
    
  }
}

