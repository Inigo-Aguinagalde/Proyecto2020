import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:juego/Models/Rutas.dart';

Future<bool> routeSelection() async {
  bool acces = false;
  final String url = 'http://10.0.2.2:8080/rutas/todas';

  final response = await http.get('$url');
  print(response.statusCode);
  if (response.statusCode == 200) {
    if (response.body == 'true') {
      acces = true;
    } else {
      print("No se han podido cargar la ruta");
      acces = false;
    }
  } else {
    print("Error de conexion con la api, estado:" +
        response.statusCode.toString());
    acces = false;
  }
  return acces;
}
