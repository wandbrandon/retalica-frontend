import 'package:fl_chart/fl_chart.dart';

class Stock {
  final String ticker;
  double popularity;
  int occurrences;
  List<FlSpot> last500Mins;
  List<FlSpot> last100Days;
  List<FlSpot> last100Weeks;

  Stock({this.popularity, this.occurrences, this.ticker, this.last500Mins, this.last100Days});
}
