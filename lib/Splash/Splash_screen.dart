import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          Text("this is the title of the app."),
          Row(children: [
            RaisedButton(onPressed: () {
              print("Top 5 pressed");
            }),
            RaisedButton(onPressed: () {
              print("Search was pressed");
            })
          ]),
        ]),
      ),
    );
  }
}
