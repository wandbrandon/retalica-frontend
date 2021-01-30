import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:retalica/services/alpha_service.dart';

class StockLineGraph extends StatefulWidget {
  @override
  _StockLineGraphState createState() => _StockLineGraphState();
}

class _StockLineGraphState extends State<StockLineGraph> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchAlphaResponse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LineChart(LineChartData(
              lineTouchData: LineTouchData(fullHeightTouchLine: true),
              gridData: FlGridData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: snapshot.data.oneDay,
                  barWidth: 1.5,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                )
              ],
            ));
          } else {
            return Center(child: CircularProgressIndicator.adaptive());
          }
        });
  }
}
