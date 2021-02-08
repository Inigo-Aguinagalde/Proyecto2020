import 'package:flutter/cupertino.dart';

class ContadorPuntos with ChangeNotifier {
  double _puntos = 0;

  double get getCounter {
    return _puntos;
  }

  void incrementCounter() {
    _puntos += 1;
    notifyListeners();
  }

  void resetCounter() {
    _puntos = 0;
    notifyListeners();
  }
}
