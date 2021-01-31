import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:retalica/models/stock_model.dart';

List<FlSpot> converter(Map<String, dynamic> decodedJson) {
  List<FlSpot> spots = [];
  List<dynamic> c = decodedJson['c'].toList();
  c = c.sublist(c.length - 50, c.length);
  for (int i = 0; i < c.length; i++) {
    final spot = FlSpot(i * 1.0, c[i] * 1.0);
    spots.insert(0, spot);
  }
  print(spots.toString());
  return spots;
}

Future<Stock> fetchFinnHubResponse(String ticker) async {
  Stock temp = Stock(ticker: ticker);
  DateTime now = DateTime.now().toUtc();
  String nowUNIX = '${(now.millisecondsSinceEpoch / 1000).round()}';
  print(nowUNIX);
  DateTime one = now.subtract(new Duration(days: 3)).toUtc();
  String oneUNIX = '${(one.millisecondsSinceEpoch / 1000).round()}';
  DateTime two = now.subtract(new Duration(days: 100)).toUtc();
  String twoUNIX = '${(two.millisecondsSinceEpoch / 1000).round()}';
  DateTime three = now.subtract(new Duration(days: 600)).toUtc();
  String threeUNIX = '${(three.millisecondsSinceEpoch / 1000).round()}';

  print('fetching alpha response...');
  final intraResponse = await http.get(
      'https://finnhub.io/api/v1/stock/candle?symbol=$ticker&resolution=5&from=$oneUNIX&to=$nowUNIX&token=c0b2ekn48v6sc0gs2kj0');
  // print('fetched intradaily response');
  final dailyResponse = await http.get(
      'https://finnhub.io/api/v1/stock/candle?symbol=$ticker&resolution=D&from=$twoUNIX&to=$nowUNIX&token=c0b2ekn48v6sc0gs2kj0');
  final weeklyResponse = await http.get(
      'https://finnhub.io/api/v1/stock/candle?symbol=$ticker&resolution=W&from=$threeUNIX&to=$nowUNIX&token=c0b2ekn48v6sc0gs2kj0');
  final redditQuery = await http
      .get('https://retalica-ea6wfw4i4a-ue.a.run.app/searchStock?q=$ticker');
  // final companyOverviewResponse = await http.get(
  //     'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=$ticker&apikey=UGVFXY3MJFICR7GP');
  // print('fetched daily response');

  if (intraResponse.statusCode == 200 &&
      dailyResponse.statusCode == 200 &&
      weeklyResponse.statusCode == 200 && redditQuery.statusCode == 200) {
    print('200');
    final intralist = jsonDecode(intraResponse.body);
    final dailylist = jsonDecode(dailyResponse.body);
    final weeklylist = jsonDecode(weeklyResponse.body);
    final redditvalues = jsonDecode(redditQuery.body);
    temp.last500Mins = converter(intralist);
    temp.last100Days = converter(dailylist);
    temp.last100Weeks = converter(weeklylist);
    temp.occurrences = redditvalues['submissionCount'];
    temp.popularity = redditvalues['popularity_score'];
  } else {
    print('error');
    throw Exception('Failed to load Stock');
  }
  return temp;
}

Future<Stock> fetchFinnHubResponseNoReddit(
    String ticker, int occ, double pop) async {
  Stock temp = Stock(ticker: ticker, occurrences: occ, popularity: pop);
  DateTime now = DateTime.now().toUtc();
  String nowUNIX = '${(now.millisecondsSinceEpoch / 1000).round()}';
  DateTime one = now.subtract(new Duration(days: 5)).toUtc();
  String oneUNIX = '${(one.millisecondsSinceEpoch / 1000).round()}';
  DateTime two = now.subtract(new Duration(days: 200)).toUtc();
  String twoUNIX = '${(two.millisecondsSinceEpoch / 1000).round()}';
  DateTime three = now.subtract(new Duration(days: 1000)).toUtc();
  String threeUNIX = '${(three.millisecondsSinceEpoch / 1000).round()}';

  print('fetching finn response...');
  final intraResponse = await http.get(
      'https://finnhub.io/api/v1/stock/candle?symbol=$ticker&resolution=5&from=$oneUNIX&to=$nowUNIX&token=c0b2ekn48v6sc0gs2kj0');
  // print('fetched intradaily response');
  final dailyResponse = await http.get(
      'https://finnhub.io/api/v1/stock/candle?symbol=$ticker&resolution=D&from=$twoUNIX&to=$nowUNIX&token=c0b2ekn48v6sc0gs2kj0');
  final weeklyResponse = await http.get(
      'https://finnhub.io/api/v1/stock/candle?symbol=$ticker&resolution=W&from=$threeUNIX&to=$nowUNIX&token=c0b2ekn48v6sc0gs2kj0');
  print('done fetching response.\n');

  if (intraResponse.statusCode == 200 &&
      dailyResponse.statusCode == 200 &&
      weeklyResponse.statusCode == 200) {
    print('NoReddit: 200');
    final intralist = jsonDecode(intraResponse.body);
    final dailylist = jsonDecode(dailyResponse.body);
    final weeklylist = jsonDecode(weeklyResponse.body);
    temp.last500Mins = converter(intralist);
    temp.last100Days = converter(dailylist);
    temp.last100Weeks = converter(weeklylist);
  } else if (intraResponse.statusCode == 429 ||
      dailyResponse.statusCode == 429 ||
      weeklyResponse.statusCode == 429) {
    print('Api...');
    throw Exception('Went over API amount...');
  } else {
    print('error');
    throw Exception('Failed to load Stock');
  }
  return temp;
}

Future<List<Stock>> fetchTopTen() async {
  List<Stock> stocks = [];
  print('getting top ten...');
  final topTen = await http
      .get('https://retalica-ea6wfw4i4a-ue.a.run.app/topStocks')
      .timeout(Duration(minutes: 5))
      .catchError((e) => print(e));
  print('done');

  if (topTen.statusCode == 200) {
    print('TopTen: 200');
    Map<String, dynamic> topTenMap = jsonDecode(topTen.body);
    print(topTenMap);

    await Future.forEach(topTenMap.entries, (e) async {
      print('\n${e.value.toString()}');
      Stock stock = await fetchFinnHubResponseNoReddit(
          e.value['symbol'], e.value['ocurrences'], e.value['popularity']);
      stocks.add(stock);
      print('stock added: ${stock.ticker}');
    });

    print('stocks added');
  } else {
    print('error');
    throw Exception('Failed to load Stock');
  }
  return stocks;
}
