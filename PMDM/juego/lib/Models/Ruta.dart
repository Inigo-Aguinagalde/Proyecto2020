class Ruta {
  String id;
  double km;
  String nombre;
  String ciudad;
  String duracion;
  List<dynamic> lista_puntos;
  List<Object> ranking;
  double puntos;

  Ruta({
    this.km,
    this.id,
    this.nombre,
    this.ciudad,
    this.duracion,
    this.lista_puntos,
    this.puntos,
    this.ranking,
  });

  Ruta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    ciudad = json['ciudad'];
    duracion = json['duracion'];
    km = json['km'];
    puntos = json['puntos'];
    lista_puntos = json['lista_puntos'];
    ranking = json['ranking'];
  }
}
