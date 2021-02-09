import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/widget/Chat_widget.dart';


class Chat extends StatefulWidget {
  Chat({Key key, this.usuario,this.ruta}) : super(key: key);
  String usuario;
  String ruta;
  @override
  _Chat createState() => _Chat();
}

class _Chat extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Chat_widget(
              usuario:widget.usuario,
              ruta:widget.ruta,
            ),
          ],
        ),
      ),
    );
  }
}
