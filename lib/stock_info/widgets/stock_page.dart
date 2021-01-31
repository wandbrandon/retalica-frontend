import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:retalica/models/stock_model.dart';
import 'package:retalica/scaffold/custom_scaffold.dart';
import 'package:retalica/stock_info/widgets/graph_object.dart';

class StockPage extends StatefulWidget {
  final Stock stock;

  const StockPage({Key key, this.stock}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: GraphObject(stock: widget.stock,)
    );
  }
}
