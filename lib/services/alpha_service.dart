import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:retalica/models/stock_model.dart';

List<FlSpot> last500MinsConverter(Map<String, dynamic> decodedJson) {
  List<FlSpot> spots = [];
  List<MapEntry> entries = (decodedJson["Time Series (5min)"].entries).toList();
  print(entries);
  double timeDouble = 1.0;
  for (MapEntry e in entries) {
    timeDouble -= (1 / entries.length);
    final spot = FlSpot(timeDouble, double.parse(e.value["4. close"]));
    spots.insert(0, spot);
  }
  print(spots.toString());
  return spots;
}

List<FlSpot> last100DaysConverter(Map<String, dynamic> decodedJson) {
  List<FlSpot> spots = [];
  List<MapEntry> entries =
      (decodedJson["Time Series (Daily)"].entries).toList();
  print(entries);
  double timeDouble = 1.0;
  for (MapEntry e in entries) {
    timeDouble -= (1 / entries.length);
    final spot = FlSpot(timeDouble, double.parse(e.value["5. adjusted close"]));
    spots.insert(0, spot);
  }
  return spots;
}

List<FlSpot> last100WeeksConverter(Map<String, dynamic> decodedJson) {
  List<FlSpot> spots = [];
  List<MapEntry> entries =
      (decodedJson["Weekly Adjusted Time Series"].entries).toList();
  entries = entries.sublist(0, 100);
  print(entries);
  double timeDouble = 1.0;
  for (MapEntry e in entries) {
    timeDouble -= (1 / entries.length);
    final spot = FlSpot(timeDouble, double.parse(e.value["5. adjusted close"]));
    spots.insert(0, spot);
  }
  return spots;
}

Future<Stock> fetchAlphaResponse(String ticker) async {
  Stock temp = Stock(ticker: ticker);

  print('fetching alpha response...');
  final intraResponse = await http.get(
      'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo');
  print('fetched intradaily response');
  final dailyResponse = await http.get(
      'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=demo');
  final weeklyResponse = await http.get(
      'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=IBM&apikey=demo');
  print('fetched daily response');
  print('fetched alpha response'); //

  if (intraResponse.statusCode == 200 && dailyResponse.statusCode == 200) {
    print('200');
    final intralist = jsonDecode(intraResponse.body);
    final dailylist = jsonDecode(dailyResponse.body);
    final weeklylist = jsonDecode(weeklyResponse.body);
    temp.oneDay = last500MinsConverter(intralist);
    temp.oneMonth = last100DaysConverter(dailylist);
    temp.oneYear = last100WeeksConverter(weeklylist);
  } else {
    throw Exception('Failed to load Stock');
  }
  return temp;
}
