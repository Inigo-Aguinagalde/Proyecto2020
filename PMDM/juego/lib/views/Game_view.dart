import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/Controller/LocalizacionesController.dart';
import 'package:juego/Models/Localizaciones.dart';
import 'package:juego/Models/Ruta.dart';
import 'package:juego/Models/Usuarios.dart';
import 'package:juego/widget/Map_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'Chat_view.dart';

// ignore: must_be_immutable
class Game extends StatefulWidget {
  Game({this.ruta, this.user, Key key}) : super(key: key);
  Ruta ruta;
  Usuario user;
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Localizaciones> listaLoca = List<Localizaciones>();
  int puntosLogrados = 0;
  int localizaciones_realizadas = 0;
  int localizaciones_totales = 0;
  double porcentaje_realizado = 0.00;

  initState() {
    getLocationData();
    localizaciones_totales = widget.ruta.lista_puntos.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: AppBar(
          title: Text("Game"),
        ),*/
      body: Stack(
        children: <Widget>[
          Mapa(localizaciones: listaLoca),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new LinearPercentIndicator(
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      percent: 0.10,
                      center: Text("Realizado - " +
                          porcentaje_realizado.toString() +
                          "%"),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.green,
                      backgroundColor: Colors.greenAccent[100],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {},
                      child: Icon(Icons.cancel),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Puntos:", style: TextStyle(color: Colors.white)),
                        Text(
                          puntosLogrados.toInt().toString() +
                              "/" +
                              widget.ruta.puntos.toInt().toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 80,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.ruta.nombre,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.compare_arrows_rounded,
                                  size: 20,
                                ),
                                Text(
                                  widget.ruta.km.toString() + "-Km",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.hourglass_bottom,
                                  size: 20,
                                ),
                                Text(
                                  widget.ruta.duracion + "h",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Chat(),
                              ),
                            );
                          },
                          child: Icon(Icons.chat_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ])
        ],
      ),
    );
  }

  getLocationData() {
    for (String loc in widget.ruta.lista_puntos) {
      fetchLoc(loc)
          .then((value) => listaLoca.add(value) as Map<String, dynamic>);
    }
  }
}
