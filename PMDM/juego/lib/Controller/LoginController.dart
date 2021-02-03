import 'package:http/http.dart' as http;

Future<bool> login(String email, String password) async {
  bool acces = false;
  final String url = 'http://10.10.12.133:8080/usuario/login?email=' +
      email +
      '&password=' +
      password;

  final response = await http.get('$url');
  print(response.statusCode);
  if (response.statusCode == 200) {
    if (response.body == 'true') {
      acces = true;
    } else {
      print("No esta registrado");
      acces = false;
    }
  } else {
    print("Error de conexion con la api, estado:" +
        response.statusCode.toString());
    acces = false;
  }
  return acces;
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
