import 'dart:convert';
import 'package:juego/Models/Usuarios.dart';
import 'package:http/http.dart' as http;

Future<Usuario> updateRutaActiva(String id_ruta, String id_user) async {
  var user;
  Usuario usuario;
  /*final String url =
      'http://10.10.12.133:8080/usuario/updateRutaActiva?id_ruta=' +
          id_ruta +
          '&id_user=' +
          id_user;*/
  final String url =
    'http://192.168.1.119:8080/usuario/updateRutaActiva?id_ruta=' +
    id_ruta +
    '&id_user=' +
    id_user;
  final response = await http.post(url);
  if (response.statusCode == 200) {
    user = await json.decode(response.body);
    usuario = Usuario.fromJson(user);
  }
  return usuario;
}
