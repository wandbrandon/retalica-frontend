import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:retalica/models/stock_model.dart';

List<FlSpot> oneDayConverter(Map<String, dynamic> decodedJson) {
  List<FlSpot> spots = [];
  //20:00:00 to 9:00:00
  DateTime lastRefresh =
      DateTime.parse(decodedJson["Meta Data"]["3. Last Refreshed"]);
  for (MapEntry e in decodedJson["Time Series (5min)"].entries) {
    DateTime dateTime = DateTime.parse(e.key);
    print(dateTime);
    if (lastRefresh.difference(dateTime) > Duration(hours: 11)) {
      break;
    }
    double timeDouble = (dateTime.hour * 100.0) + dateTime.minute;
    print(
        '$timeDouble, ${decodedJson["Time Series (5min)"][e.key]["4. close"]}');
    final spot = FlSpot(timeDouble,
        double.parse(decodedJson["Time Series (5min)"][e.key]["4. close"]));
    spots.add(spot);
  }
  return spots;
}

Future<Stock> fetchAlphaResponse() async {
  print('fetched alpha response');
  final response = await http.get(
      'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&outputsize=full&apikey=demo');

  if (response.statusCode == 200) {
    print('200');
    final intralist = jsonDecode(response.body);
    List<FlSpot> test = oneDayConverter(intralist);
    return new Stock(ticker: 'IBM', lastUpdated: DateTime.now(), oneDay: test);
  } else {
    throw Exception('Failed to load Stock');
  }
}
