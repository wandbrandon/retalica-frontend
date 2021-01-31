import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:retalica/models/stock_model.dart';
import 'package:retalica/scaffold/custom_scaffold.dart';
import 'package:retalica/services/alpha_service.dart';
import 'package:retalica/topfive/stock_button.dart';

class TopFivePage extends StatefulWidget {
  @override
  _TopFivePageState createState() => _TopFivePageState();
}

class _TopFivePageState extends State<TopFivePage> {
  List<Widget> buildTopFive(Stock stock) {
    return List<Widget>.generate(10, (int index) => StockButton(stock: stock));
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<Stock>(
        create: (context) => fetchAlphaResponse('IBM'),
        builder: (context, child) {
          Stock tempStock = context.watch<Stock>();
          return CustomScaffold(
              body: tempStock != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                            'Thanks for waiting. These are your top ten stocks as requested.'),
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
                            children: buildTopFive(tempStock),
                          ),
                        ),
                      ],
                    )
                  : Center(child: SpinKitRotatingPlain(

  color: Theme.of(context).highlightColor,
  size: 50.0,
)));
        });
  }
}
