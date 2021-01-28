class Ruta {
  String id;

  int km;
  String nombre;
  String ciudad;
  String duracion;
  List<dynamic> lista_puntos;
  int puntos;

  Ruta({
    this.km,
    this.id,
    this.nombre,
    this.ciudad,
    this.duracion,
    this.lista_puntos,
    this.puntos,
  });

  Ruta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    ciudad = json['ciudad'];
    duracion = json['duracion'];
    km = json['km'];
    puntos = json['puntos'];
    lista_puntos = json['lista_puntos'];
  }
}
