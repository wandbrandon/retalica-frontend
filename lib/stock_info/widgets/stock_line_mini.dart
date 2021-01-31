import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retalica/models/stock_model.dart';
import 'package:retalica/services/graph_state.dart';

class StockLineMini extends StatefulWidget {
  final Stock stock;

  const StockLineMini({Key key, this.stock}) : super(key: key);

  @override
  _StockLineMiniState createState() => _StockLineMiniState();
}

class _StockLineMiniState extends State<StockLineMini> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      buildMonth(widget.stock, true) ,
      swapAnimationDuration: Duration(milliseconds: 600),
    );
  }

  LineChartData buildMonth(Stock stock, bool curve) {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(show: false),
      axisTitleData: FlAxisTitleData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(show: false),
      lineBarsData: [
        LineChartBarData(
            spots: stock.last100Days,
            barWidth: 3,
            isCurved: curve,
            dotData: FlDotData(
              show: false,
            ),
            colors: [Theme.of(context).accentColor])
      ],
    );
  }
}
