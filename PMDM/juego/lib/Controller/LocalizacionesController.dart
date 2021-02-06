import 'dart:convert';
import 'package:juego/Models/Localizaciones.dart';
import 'package:http/http.dart' as http;

Future<Localizaciones> fetchLoc(String id) async {
  final response = await http
      .get('http://10.10.12.133:8080/localizaciones/findByID?id=' + id);
  var loc;
  Localizaciones loc_vuelta;
  if (response.statusCode == 200) {
    loc = json.decode(response.body);
    loc_vuelta = Localizaciones.fromJson(loc, id);
  }

  return loc_vuelta;
}

Future<List<Localizaciones>> listaDePuntos(List listaIDs) {
  List<Localizaciones> listaVuelta;
  for (int i = 0; i < listaIDs.length; i++) {
    Localizaciones loc = fetchLoc(listaIDs[i]) as Localizaciones;
    listaVuelta.add(loc);
  }
  return listaVuelta as Future;
}
