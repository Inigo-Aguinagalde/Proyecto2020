import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/widget/Register_widget.dart';

class Register extends StatefulWidget {
  Register({Key key, AssetImage fondo}) : super(key: key);

  final AssetImage fondo = AssetImage("assets/images/fondo.jpeg");

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.fondo,
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 350,
                color: Colors.grey[100].withOpacity(0.7),
                child: WidgetRegister(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
