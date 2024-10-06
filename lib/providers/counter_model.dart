import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void setCounter(int number) {
    _counter = number;
  }

  void increment() {
    _counter++;
    notifyListeners();
  }
}