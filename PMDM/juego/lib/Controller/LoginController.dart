import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:juego/Models/usuario.dart';

Future<Usuario> login(String email, String password) async {
  var user;
  final String url = 'http://10.10.12.133:8080/usuario/login?email=' +
      email +
      '&password=' +
      password;

  final response = await http.get('$url');
  print(response.statusCode);
  if (response.statusCode == 200) {
    if (response.body != null) {
      user = await json.decode(response.body);
      print(user);
      Usuario usuario = Usuario.fromJson(user);
      return usuario;
    }
  } else {
    user = null;
    print("Error de conexion con la api, estado:" +
        response.statusCode.toString());
  }
  return user;
}

Future<bool> registro(String email, String password, String username) async {
  bool regis = false;
  final String url = 'http://10.10.12.133:8080/usuario/añadir?username=' +
      username +
      '&email=' +
      email +
      '&password=' +
      password;
  final response = await http.post('$url');
  print(response.statusCode);
  if (response.statusCode == 200) {
    if (response.body == 'true') {
      regis = true;
    } else {
      print("Error al crear el usuario");
      regis = false;
    }
  } else {
    print("Error de conexion con la api, estado:" +
        response.statusCode.toString());
    regis = false;
  }
  return regis;
}
