import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retalica/scaffold/appBar_action.dart';
import 'package:retalica/search/search.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;

  const CustomScaffold({Key key, this.body}) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 20,
          title: Row(
            children: [
              Image.asset(
                'lib/assets/retalica_small.png',
                color: Colors.white,
                height: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Text('Retalica')
            ],
          ),
          actions: [
            AppBarAction(
                route: '/search',
                onTap: () {
                  showSearch(context: context, delegate: Search());
                }),
            AppBarAction(
                route: '/topfive',
                onTap: () {
                  Navigator.pushNamed(context, '/topfive');
                }),
            AppBarAction(
                route: '/about',
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                }),
            
            AppBarAction(
                route: '/',
                onTap: () {
                  Navigator.pushNamed(context, '/');
                }),
          ],
        ),
        body: SingleChildScrollView(
          child: widget.body,
        ));

  }
}
