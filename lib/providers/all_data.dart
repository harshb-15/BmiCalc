import 'package:flutter/material.dart';

class AllData with ChangeNotifier {
  int _weight = 75;
  int _height = 160;
  double bmi = 0.0;

  int get weight {
    return _weight;
  }

  int get height {
    return _height;
  }

  void setWeight(double w) {
    _weight = w.toInt();
    notifyListeners();
  }

  void setHeight(double h) {
    _height = h.toInt();
    notifyListeners();
  }

  void calc() {
    bmi =
        weight.toDouble() / (height.toDouble() / 100 * height.toDouble() / 100);
    bmi = double.parse((bmi).toStringAsFixed(1));
    notifyListeners();
  }
}
