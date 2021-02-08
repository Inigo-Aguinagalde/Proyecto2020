class Ranking {
  String id;
  String id_usuario;
  String id_ruta;
  double puntuacion;

 Ranking({
   this.id,
   this.id_usuario,
   this.id_ruta,
   this.puntuacion
 });

 Ranking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    id_usuario = json['idUsuario'];
    id_ruta = json['idRuta'];
    puntuacion = json['puntuacion'];
  }
}