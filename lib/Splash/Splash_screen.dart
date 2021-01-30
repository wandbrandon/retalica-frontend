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
        alignment: Alignment.center,
        margin: EdgeInsets.all(50),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            child: Text('The title of this statment'),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[800]),
            margin: EdgeInsets.all(260),
            padding: EdgeInsets.all(70),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonTheme(
                    minWidth: 200,
                    height: 100,
                    child: RaisedButton(
                        onPressed: () {
                          print("Top 5 pressed");
                        },
                        child: Text("Search stock tickers"),
                        color: Colors.blue[800]),
                  ),
                  ButtonTheme(
                      minWidth: 200,
                      height: 100,
                      child: RaisedButton(
                        onPressed: () {
                          print("Search was pressed");
                        },
                        child: Text("Search stock tickers"),
                        color: Colors.blue[800],
                      ))
                ]),
          ),
        ]),
      ),
    );
  }
}
