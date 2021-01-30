import 'package:fl_chart/fl_chart.dart';

class Stock {
  final String ticker;
  final DateTime lastUpdated;
  List<FlSpot> oneDay;
  // List<FlSpot> oneWeek;
  // List<FlSpot> oneMonth;
  // List<FlSpot> threeMonth;
  // List<FlSpot> oneYear;
  // List<FlSpot> fiveYear;

  Stock({
    this.ticker,
    this.lastUpdated,
    this.oneDay,
  });
}
