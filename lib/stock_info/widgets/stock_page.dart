import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StockPage extends StatefulWidget {
  final String ticker;

  const StockPage({Key key, this.ticker}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
