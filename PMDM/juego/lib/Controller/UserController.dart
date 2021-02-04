import 'dart:convert';
import 'package:juego/Models/usuario.dart';
import 'package:http/http.dart' as http;

Future<Usuario> updateRutaActiva(String id) async {
  final response = await http.get('http://192.168.1.119:8080/');
  Usuario usuario;
  if (response.statusCode == 200) {
    usuario = json.decode(response.body);
  }
  print(usuario);
  return usuario;
}
