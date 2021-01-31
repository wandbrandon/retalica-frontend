import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:retalica/about.dart';
import 'package:retalica/search/search.dart';
import 'package:retalica/services/alpha_service.dart';
import 'package:retalica/splash/splash_screen.dart';
import 'package:retalica/scaffold/custom_scaffold.dart';
import 'package:retalica/stock_info/widgets/graph_object.dart';
import 'package:retalica/topfive/top_five_page.dart';

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
            backgroundColor: Colors.grey[900],
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
          '/': (context) => SplashScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/about': (context) => AboutPage(),
          '/topfive': (context) => TopFivePage(),
        },
      ),
    );
  }
}
