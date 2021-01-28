import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:juego/Models/Ruta.dart';

Future<List<Ruta>> fetchRuta() async {
  final response = await http.get('http://10.0.2.2:8080/rutas/todas');
  var rutas = List<Ruta>();
  if (response.statusCode == 200) {
    var ruta = json.decode(response.body);
    for (var rutes in ruta) {
      rutas.add(Ruta.fromJson(rutes));
    }
  }

  return rutas;
}
