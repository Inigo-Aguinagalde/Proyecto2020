import 'package:flutter/material.dart';
import 'package:juego/Controller/RouteController.dart';
import 'package:juego/Controller/UserController.dart';
import 'package:juego/Models/Ruta.dart';
import 'package:juego/Models/Usuarios.dart';
import 'package:juego/views/Game_view.dart';

class RouteSelection extends StatefulWidget {
  RouteSelection({this.user, Key key}) : super(key: key);
  Usuario user;
  _WidgetRoute createState() => _WidgetRoute();
}

class _WidgetRoute extends State<RouteSelection> {
  List<Ruta> _rutas = List<Ruta>();
  Usuario loged_user;

  @override
  Widget build(BuildContext context) {
    setState(() {
      loged_user = widget.user;
    });
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
          title: Text(loged_user.name),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                margin: const EdgeInsets.only(top: 32, left: 16, right: 18),
                color: Colors.blue[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _rutas[index].nombre,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text('Ciudad: ' + _rutas[index].ciudad),
                    Text('Duracion:' + _rutas[index].duracion + 'h'),
                    // ignore: missing_required_param
                    IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          updateRutaActiva(_rutas[index].id, widget.user.id)
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Game(
                                  ruta: _rutas[index],
                                  user: value,
                                ),
                              ),
                            );
                          });
                        }),
                  ],
                ));
          },
          itemCount: _rutas.length,
        ),
      ),
    );
  }
}
