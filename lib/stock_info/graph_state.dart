import 'package:flutter/material.dart';

enum GraphView { oneDay, oneWeek, oneMonth, threeMonth, oneYear, fiveYear }

class GraphState with ChangeNotifier {
  GraphView _view;

  GraphState(GraphView def) {
    _view = GraphView.oneDay;
  }

  GraphView get getView => _view;
  
  set(GraphView view) {
    _view = view;
    notifyListeners();
  }
}
