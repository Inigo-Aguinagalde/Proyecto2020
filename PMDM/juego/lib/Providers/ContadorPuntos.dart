import 'package:flutter/cupertino.dart';

class ContadorPuntos with ChangeNotifier {
  double _puntos = 0;
  int _contestadas = 0;
  double _porcentaje = 0.0;

  double get getPuntos {
    return _puntos;
  }

  int get getContestadas {
    return _contestadas;
  }

  double get getPorcentaje {
    return _porcentaje;
  }

  void setPorcentaje(int localizaciones) {
    int total = 100;
    _porcentaje = ((_contestadas * total) / localizaciones);
  }

  void increment_Cont() {
    _contestadas += 1;
    notifyListeners();
  }

  void reset_Cont() {
    _contestadas = 0;
    notifyListeners();
  }

  void reset_Porc() {
    _porcentaje = 0;
    notifyListeners();
  }

  void incrementPuntos() {
    _puntos += 1;
    notifyListeners();
  }

  void resetPuntos() {
    _puntos = 0;
    notifyListeners();
  }
}
