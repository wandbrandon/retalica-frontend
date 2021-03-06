import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retalica/about.dart';
import 'package:retalica/main.dart';
import 'package:retalica/scaffold/custom_scaffold.dart';
import 'package:retalica/search/search.dart';
import 'package:retalica/topfive/top_ten_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        alignment: Alignment.center,
        margin: EdgeInsets.all(60),
        child: Column(children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.all(230),
            padding: EdgeInsets.all(70),
            child: Text(
              'Retalica',
              style: TextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonTheme(
                    minWidth: 200,
                    height: 100,
                    child: RaisedButton(
                        onPressed: () {
                          print("Top 5 pressed");
                          Navigator.of(context).pushNamed('/top5');
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
                          Navigator.of(context).pushNamed('/about');
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

                          showSearch(context: context, delegate: Search());
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
