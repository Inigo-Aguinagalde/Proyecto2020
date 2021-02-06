class Localizaciones {
  String id;
  double latitud;
  double longitud;
  String nombre;
  String pregunta;
  String respuesta1;
  String respuesta2;
  String respuesta3;
  int solucion;

  Localizaciones(
      {this.id,
      this.latitud,
      this.longitud,
      this.nombre,
      this.pregunta,
      this.respuesta1,
      this.respuesta2,
      this.respuesta3,
      this.solucion});

  Localizaciones.fromJson(Map<String, dynamic> json, id) {
    id = id;
    nombre = json['nombre'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    pregunta = json['pregunta'];
    respuesta1 = json['respuesta1'];
    respuesta2 = json['respuesta2'];
    respuesta3 = json['respuesta3'];
    solucion = json['solucion'];
  }
}
