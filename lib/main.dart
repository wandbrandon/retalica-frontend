import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:retalica/about.dart';
import 'package:retalica/services/alpha_service.dart';
import 'package:retalica/scaffold/custom_scaffold.dart';
import 'package:retalica/stock_info/widgets/graph_object.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (_) => 'Retalica',
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: context.watch<String>(),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            backgroundColor: Colors.grey,
            canvasColor: Colors.black,
            primaryColor: Colors.black,
            accentColor: Colors.blue,
            iconTheme: ThemeData.dark().iconTheme.copyWith(color: Colors.white),
            textTheme: ThemeData.dark()
                .textTheme
                .apply(bodyColor: Colors.white, displayColor: Colors.white)),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => MyHomePage(
                title: 'Retalica',
              ),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/about': (context) => AboutPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: Center(child: GraphObject()));
  }
}
