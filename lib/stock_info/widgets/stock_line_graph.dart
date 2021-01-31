import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retalica/models/stock_model.dart';
import 'package:retalica/services/graph_state.dart';

class StockLineGraph extends StatefulWidget {
  @override
  _StockLineGraphState createState() => _StockLineGraphState();
}

class _StockLineGraphState extends State<StockLineGraph> {
  LineChartData decider(GraphState state, Stock stock) {
    switch (state.getView.index) {
      case 0:
        return build500Mins(stock);
      case 1:
        return build100Days(stock);
      case 2:
        return build100Weeks(stock);
      default:
        return build500Mins(stock);
    }
  }

  @override
  Widget build(BuildContext context) {
    GraphState state = context.watch<GraphState>();
    Stock stock = context.watch<Stock>();
    return LineChart(decider(state, stock), swapAnimationDuration: Duration(milliseconds: 600),);
  }

  LineChartData build500Mins(Stock stock) {
    return LineChartData(
      lineTouchData: LineTouchData(fullHeightTouchLine: true,
      touchTooltipData: LineTouchTooltipData(
        showOnTopOfTheChartBoxArea: true,
        tooltipBgColor: Colors.transparent,
      )),
      gridData: FlGridData(show: false),
      axisTitleData: FlAxisTitleData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(show: false),

      lineBarsData: [
        LineChartBarData(
            spots: stock.last500Mins,
            
            barWidth: 1.5,
            isCurved: true,
            dotData: FlDotData(
              show: false,
            ),
            colors: [Theme.of(context).accentColor])
      ],
    );
  }

  LineChartData build100Days(Stock stock) {
    return LineChartData(
      lineTouchData: LineTouchData(fullHeightTouchLine: true,
      touchTooltipData: LineTouchTooltipData(
        showOnTopOfTheChartBoxArea: true,
        tooltipBgColor: Colors.transparent,
      )),
      gridData: FlGridData(show: false),
      lineBarsData: [
        LineChartBarData(
            spots: stock.last100Days,
            barWidth: 1.5,
            //isStrokeCapRound: true,
            isCurved: true,
            dotData: FlDotData(
              show: false,
            ),
            colors: [Theme.of(context).accentColor])
      ],
    );
  }

  LineChartData build100Weeks(Stock stock) {
    return LineChartData(
      lineTouchData: LineTouchData(fullHeightTouchLine: true,
      touchTooltipData: LineTouchTooltipData(
        showOnTopOfTheChartBoxArea: true,
        tooltipBgColor: Colors.transparent,
      )),
      gridData: FlGridData(show: false),
      lineBarsData: [
        LineChartBarData(
            spots: stock.last100Weeks,
            barWidth: 1.5,
            isCurved: true,
            //isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            colors: [Theme.of(context).accentColor])
      ],
    );
  }
}
