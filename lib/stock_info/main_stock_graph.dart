import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retalica/stock_info/graph_state.dart';
import 'package:retalica/stock_info/widgets/stock_line_graph.dart';
import 'package:tap_builder/tap_builder.dart';

import 'widgets/timeframe_button.dart';

class LineChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GraphState(GraphView.oneDay),
      builder: (context, child) => AspectRatio(
        aspectRatio: 1.23,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StockLineGraph(),

              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                TimeFrameButton(
                  onTap: () {
                    context.read<GraphState>().set(GraphView.oneDay);
                  },
                  text: '1D',
                  view: GraphView.oneDay,
                ),
                 TimeFrameButton(
                  onTap: () {
                    context.read<GraphState>().set(GraphView.oneWeek);
                  },
                  text: '1W',
                  view: GraphView.oneWeek,
                ),
                
                TimeFrameButton(
                  onTap: () {
                    context.read<GraphState>().set(GraphView.oneMonth);
                  },
                  text: '1M',
                  view: GraphView.oneMonth,
                ),
                TimeFrameButton(
                  onTap: () {
                    context.read<GraphState>().set(GraphView.threeMonth);
                  },
                  text: '3M',
                  view: GraphView.threeMonth,
                ),
                TimeFrameButton(
                  onTap: () {
                    context.read<GraphState>().set(GraphView.oneYear);
                  },
                  text: '1Y',
                  view: GraphView.oneYear,
                ),
                TimeFrameButton(
                  onTap: () {
                    context.read<GraphState>().set( GraphView.fiveYear);
                  },
                  text: '5Y',
                  view: GraphView.fiveYear,
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

 
}
