import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:juego/widget/Login_widget.dart';

class Login extends StatefulWidget {
  Login({Key key, AssetImage fondo}) : super(key: key);

  final AssetImage fondo = AssetImage("assets/images/fondo.jpeg");

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.fondo,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.grey[100].withOpacity(0.7),
                child: WidgetLogin(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
