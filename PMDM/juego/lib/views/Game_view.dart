import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/Models/Localizaciones.dart';
import 'package:juego/Models/Ruta.dart';
import 'package:juego/widget/Map_widget.dart';

import 'package:percent_indicator/percent_indicator.dart';

// ignore: must_be_immutable
class Game extends StatefulWidget {
  Game({this.ruta, Key key}) : super(key: key);
  Ruta ruta;
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var puntosLogrados = 0;
  var localizaciones_realizadas = 0;
  var localizaciones_totales = 0;
  double porcentaje_realizado = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: Text("Game"),
        ),*/
      body: Stack(
        children: <Widget>[
          Mapa(),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: 0.10,
                    center: Text("Localizaciones ralizadas - " +
                        porcentaje_realizado.toString() +
                        "%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.green,
                    backgroundColor: Colors.greenAccent[100],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Puntos:", style: TextStyle(color: Colors.white)),
                        Text(
                          puntosLogrados.toString() +
                              "/" +
                              widget.ruta.puntos.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.ruta.nombre,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),

                        ///Todos estos datos vienen de la ventana anterior///
                        Text(
                          widget.ruta.km.toString() + "-Km",
                          style: TextStyle(color: Colors.white),
                        ),

                        ///Todos estos datos vienen de la ventana anterior///
                        Text(
                          widget.ruta.duracion + "h",
                          style: TextStyle(color: Colors.white),
                        ),

                        ///Todos estos datos vienen de la ventana anterior///
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
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
}
