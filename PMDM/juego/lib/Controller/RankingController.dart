import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:juego/Models/Ranking.dart';

Future<List<Ranking>> fetchRutaRanking(String id_ruta) async {
  //final response = await http.get('http://10.10.12.133:8080/ranking/getByRouteId?id_ruta='+id_ruta);
  final response = await http.get('http://192.168.1.119:8080/ranking/getByRouteId?id_ruta='+id_ruta);
  var registros;
  if (response.statusCode == 200) {
    var registro = await json.decode(response.body);
    List<dynamic> decoded = registro;
    registros = decoded.map<Ranking>((e) => Ranking.fromJson(e)).toList();
  }

  return registros;
}

Future<List<Ranking>> addRegistro(double puntos, String id_usuario, String id_ruta) async{
//final response = await http.post('http://10.10.12.133:8080/ranking/añadir?puntos='+puntos.toString()+'&id_usuarios='+id_usuario+'&id_ruta='+id_ruta);
  final response = await http.post('http://192.168.1.119:8080/ranking/añadir?puntos='+puntos.toString()+'&id_usuarios='+id_usuario+'&id_ruta='+id_ruta);
  var registros;
  if (response.statusCode == 200) {
    var registro = await json.decode(response.body);
    List<dynamic> decoded = registro;
    registros = decoded.map<Ranking>((e) => Ranking.fromJson(e)).toList();
  }

  return registros;
}