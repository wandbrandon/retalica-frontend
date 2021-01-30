import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retalica/about.dart';
import 'package:retalica/main.dart';
import 'package:retalica/topfive/top_five_page.dart';

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
        color: Colors.orange[700],
        alignment: Alignment.center,
        margin: EdgeInsets.all(60),
        child: Column(children: [
          Container(
            child: Text('The title of this statment'),
            decoration: BoxDecoration(color: Colors.blue[800]),
            margin: EdgeInsets.all(230),
            padding: EdgeInsets.all(70),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 170),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonTheme(
                    minWidth: 200,
                    height: 100,
                    child: RaisedButton(
                        onPressed: () {
                          print("Top 5 pressed");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TopFivePage()));
                        },
                        child: Text("5 most talked about stocks"),
                        color: Colors.blue[800]),
                  ),
                  ButtonTheme(
                    minWidth: 200,
                    height: 100,
                    child: RaisedButton(
                        onPressed: () {
                          print("About us was pressed");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutPage()));
                        },
                        child: Text("About Us"),
                        color: Colors.blue[800]),
                  ),
                  ButtonTheme(
                      minWidth: 200,
                      height: 100,
                      child: RaisedButton(
                        onPressed: () {
                          print("Search was pressed");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyHomePage()));
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
