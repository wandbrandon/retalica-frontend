import 'package:fl_chart/fl_chart.dart';

class Stock {
  final String ticker;
  final DateTime lastUpdated;
  List<FlSpot> last500Mins;
  // List<FlSpot> oneWeek;
  List<FlSpot> last100Days; // List<FlSpot> threeMonth;
  List<FlSpot> last100Weeks;
  // List<FlSpot> fiveYear;

  Stock({this.ticker, this.lastUpdated, this.last500Mins, this.last100Days});
}
