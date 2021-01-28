import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:juego/Models/Ruta.dart';

Future<List<Ruta>> fetchRuta() async {
  final response = await http.get('http://10.0.2.2:8080/rutas/todas');
  var rutas;
  if (response.statusCode == 200) {
    var ruta = await json.decode(response.body);
    List<dynamic> decoded = ruta;
    rutas = decoded.map<Ruta>((e) => Ruta.fromJson(e)).toList();
  }

  return rutas;
}
