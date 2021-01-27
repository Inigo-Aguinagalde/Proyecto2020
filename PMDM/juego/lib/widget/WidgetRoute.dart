import 'package:flutter/material.dart';
import 'package:juego/Controller/RouteController.dart';
import 'package:juego/Models/Ruta.dart';
import 'package:juego/views/Game_view.dart';

class WidgetRoute extends StatefulWidget {
  const WidgetRoute({Key key}) : super(key: key);
  _WidgetRoute createState() => _WidgetRoute();
}

class _WidgetRoute extends State<WidgetRoute> {
  var ruta;

  List<Ruta> _rutas = List<Ruta>();

  @override
  Widget build(BuildContext context) {
    fetchRuta().then((value) {
      setState(() {
        _rutas.addAll(value);
      });
    });

    return MaterialApp(
      title: 'Seleccion de rutas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seleccion de rutas'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                margin: const EdgeInsets.only(
                    top: 32, bottom: 32, left: 16, right: 18),
                child: Column(
                  children: <Widget>[
                    Text(
                      _rutas[index].nombre,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(_rutas[index].ciudad),
                    Text(_rutas[index].duracion)
                  ],
                ));
          },
          itemCount: _rutas.length,
        ),
      ),
    );
  }
}
