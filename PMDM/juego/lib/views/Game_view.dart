import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/Models/Ruta.dart';

class Game extends StatefulWidget {
  Game(Ruta ruta, {Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
