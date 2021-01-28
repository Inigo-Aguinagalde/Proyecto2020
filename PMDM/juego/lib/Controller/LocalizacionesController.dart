import 'dart:convert';
import 'package:juego/Models/Localizaciones.dart';
import 'package:http/http.dart' as http;

Future<Localizaciones> fetchLoc(String id) async {
  final response =
      await http.get('http://10.0.2.2:8080/localizaciones/findByID?id=' + id);
  var locs = List<Localizaciones>();
  if (response.statusCode == 200) {
    var loc = json.decode(response.body);
    for (var locs in loc) {
      locs.add(Localizaciones.fromJson(locs));
    }
  }

  return locs as Future;
}

Future<List<Localizaciones>> listaDePuntos(List listaIDs) {
  List<Localizaciones> listaVuelta;
  for (int i = 0; i < listaIDs.length; i++) {
    Localizaciones loc = fetchLoc(listaIDs[i]) as Localizaciones;
    listaVuelta.add(loc);
  }
  return listaVuelta as Future;
}
