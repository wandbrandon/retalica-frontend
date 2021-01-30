import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retalica/scaffold/appBar_action.dart';

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
        title: Row(children: [
          Image.asset(
            'lib/assets/retalica_small.png',
            color: Colors.white,
            height: 25,
          ),
          SizedBox(width: 15,),
          Text('Retalica')

        ],),
        actions: [
          AppBarAction(route: '/'),
          AppBarAction(route: '/about'),
          AppBarAction(route: '/topfive'),
          AppBarAction(route: '/search'),
        ],
      ),
      body: widget.body
      
    );
  }
}