class Usuario {
  String id;
  String name;
  String email;
  String password;
  String ruta_activa;

  Usuario({this.name, this.email, this.password, this.ruta_activa});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    ruta_activa = json['ruta_activa'];
  }
}
