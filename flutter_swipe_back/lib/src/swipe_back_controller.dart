import 'package:flutter/material.dart';

class SwipeBackController extends ChangeNotifier {
  double _dragPercent = 0.0;

  double get dragPercent => _dragPercent;

  bool get isCompleted => _dragPercent >= 1.0;

  void update(double value) {
    _dragPercent = value.clamp(0.0, 1.0);
    notifyListeners();
  }

  void reset() {
    _dragPercent = 0.0;
    notifyListeners();
  }
}