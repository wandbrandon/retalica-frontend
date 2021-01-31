import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:retalica/models/stock_model.dart';
import 'package:retalica/scaffold/custom_scaffold.dart';
import 'package:retalica/services/finnhub_service.dart';
import 'package:retalica/topfive/stock_button.dart';

class TopTenPage extends StatefulWidget {
  @override
  _TopTenPageState createState() => _TopTenPageState();
}

class _TopTenPageState extends State<TopTenPage> {
  List<Widget> buildTopTen(List<Stock> stock) {
    return List<Widget>.generate(
        stock.length, (int index) => StockButton(stock: stock[index]));
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Stock>>(
        create: (context) => fetchTopTen(),
        catchError: (context, object) {
          print(object.toString());
          return [];
        },
        builder: (context, child) {
          List<Stock> tempStock = context.watch<List<Stock>>();
          return CustomScaffold(
              body: tempStock != null
                  ? tempStock.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                  'Thanks for waiting. These are your top ten stocks as requested.'),
                            ),
                            Container(
                              padding: const EdgeInsets.all(32.0),
                              alignment: Alignment.center,
                              child: GridView.extent(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: 16 / 9 * 1.0,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                maxCrossAxisExtent: 450,
                                children: buildTopTen(tempStock),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                              "Something went wrong, it might be our servers or our limits on API calls"))
                  : Center(
                      child: SpinKitRotatingPlain(
                      color: Theme.of(context).highlightColor,
                      size: 50.0,
                    )));
        });
  }
}
