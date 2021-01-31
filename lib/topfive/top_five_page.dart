import 'package:flutter/material.dart';
import 'package:retalica/scaffold/custom_scaffold.dart';
import 'package:retalica/topfive/stock_button.dart';

class TopFivePage extends StatefulWidget {
  @override
  _TopFivePageState createState() => _TopFivePageState();
}

class _TopFivePageState extends State<TopFivePage> {
  List<Widget> buildTopFive() {
    return List<Widget>.generate(5, (int index) => StockButton());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Wrap(children: buildTopFive(), runSpacing: 16, spacing: 16,),
    ));
  }
}
