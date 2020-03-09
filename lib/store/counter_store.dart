import 'package:flutter/widgets.dart';

class CounterStore with ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
