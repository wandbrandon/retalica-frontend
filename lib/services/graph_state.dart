import 'package:flutter/material.dart';
import 'package:retalica/models/stock_model.dart';

enum GraphView {
  last500mins,
  last100days,
  last100wks,
}

class GraphState with ChangeNotifier {
  GraphView _view;

  GraphState(GraphView def) {
    _view = GraphView.last500mins;
  }

  GraphView get getView => _view;

  set(GraphView view) {
    _view = view;
    notifyListeners();
  }
}
