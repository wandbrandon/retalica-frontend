import 'package:fl_chart/fl_chart.dart';

class Stock {
  final String ticker;
  List<FlSpot> last500Mins;
  List<FlSpot> last100Days;
  List<FlSpot> last100Weeks;

  Stock({this.ticker, this.last500Mins, this.last100Days});
}
