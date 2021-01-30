import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retalica/models/stock_model.dart';
import 'package:retalica/services/alpha_service.dart';
import 'package:retalica/services/graph_state.dart';
import 'package:retalica/stock_info/widgets/stock_line_graph.dart';
import 'package:tap_builder/tap_builder.dart';

import 'timeframe_button.dart';

class GraphObject extends StatefulWidget {
  final String ticker;

  const GraphObject({Key key, this.ticker}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GraphObjectState();
}

class GraphObjectState extends State<GraphObject> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<Stock>(
          create: (context) => fetchAlphaResponse(widget.ticker)
        ),
        ChangeNotifierProvider<GraphState>(
          create: (context) => GraphState(GraphView.last500mins),
        )

      ],
      builder: (context, child) => Padding(
        padding: const EdgeInsets.all(100.0),
        child: AnimatedCrossFade(
          crossFadeState: context.watch<Stock>()==null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          alignment: Alignment.center,
          duration: Duration(milliseconds: 600),
          firstCurve: Curves.ease,
          secondCurve: Curves.ease,
          sizeCurve: Curves.ease,
          firstChild: Center(child: CircularProgressIndicator.adaptive()),
          secondChild: context.watch<Stock>()!=null ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TimeFrameButton(
                    onTap: () {
                      context.read<GraphState>().set(GraphView.last500mins);
                    },
                    text: '~9HR',
                    view: GraphView.last500mins,
                  ),
                  SizedBox(width: 20,),
                  
                  TimeFrameButton(
                    onTap: () {
                      context.read<GraphState>().set(GraphView.last100days);
                    },
                    text: '~3M',
                    view: GraphView.last100days,
                  ),
                  SizedBox(width: 20,),
                  
                  TimeFrameButton(
                    onTap: () {
                      context.read<GraphState>().set(GraphView.last100wks);
                    },
                    text: '~2Y',
                    view: GraphView.last100wks,
                  ),
                  SizedBox(width: 20,),
                ]),
                  SizedBox(height: 60,),
                  Container(
                    height: 225,
                    child: StockLineGraph())
              ],
            ),
          ): Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
