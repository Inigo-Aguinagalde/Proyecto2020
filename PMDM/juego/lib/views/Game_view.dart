import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/Models/Ruta.dart';
import 'package:juego/widget/Map_widget.dart';

import 'package:percent_indicator/percent_indicator.dart';

// ignore: must_be_immutable
class Game extends StatefulWidget {
  Game({
    Key key,
    Ruta ruta,
  }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
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
                    center: Text("Completado - 00.0%"),
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
                    color: Colors.red,
                    child: Center(
                      child: Text(""),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nombre ruta"),

                        ///Todos estos datos vienen de la ventana anterior///
                        Text("Km de ruta"),

                        ///Todos estos datos vienen de la ventana anterior///
                        Text("Tiempo estimado"),

                        ///Todos estos datos vienen de la ventana anterior///
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.grey,
                    child: Center(child: Text("Cronometro")),
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
