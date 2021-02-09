class Ranking {
  String id;
  String idUsuario;
  String idRuta;
  double puntuacion;

  Ranking({this.idUsuario, this.idRuta, this.puntuacion});

  Ranking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUsuario = json['idUsuario'];
    idRuta = json['idRuta'];
    puntuacion = json['puntuacion'];
  }
}
