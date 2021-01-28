import 'package:flutter/material.dart';
import 'package:juego/Controller/RouteController.dart';
import 'package:juego/Models/Localizaciones.dart';
import 'package:juego/Models/Ruta.dart';
import 'package:juego/views/Game_view.dart';

class RouteSelection extends StatefulWidget {
  const RouteSelection({Key key}) : super(key: key);
  _WidgetRoute createState() => _WidgetRoute();
}

class _WidgetRoute extends State<RouteSelection> {
  List<Ruta> _rutas = List<Ruta>();

  @override
  Widget build(BuildContext context) {
    /*fetchRuta().then((value) {
      setState(() {
        _rutas.addAll(value);
      });
    });*/

    return MaterialApp(
      title: 'Seleccion de rutas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Seleccion de rutas'),
          ),
          body: ListView(
            children: [
              FutureBuilder<List<Ruta>>(
                future: fetchRuta(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    for (var i = 0; i < snapshot.data.length; i++) {
                      print(i);

                      Widget Card(
                        margin: const EdgeInsets.only(
                            top: 32, bottom: 32, left: 16, right: 18),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${snapshot.data[i].nombre}',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            Text('Ciudad:  ${snapshot.data[i].ciudad}'),
                            Text('Duracion: ${snapshot.data[i].duracion} h'),
                            // ignore: missing_required_param
                            IconButton(
                              icon: Icon(Icons.check),
                              tooltip: 'Increase volume by 10',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Game(ruta: snapshot.data[i]),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    print("error");
                  }
                },
              ),
            ],
          )

          /*body: ListView.builder(
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
                  Text('Ciudad: ' + _rutas[index].ciudad),
                  Text('Duracion:' + _rutas[index].duracion + 'h'),
                  // ignore: missing_required_param
                  IconButton(
                    icon: Icon(Icons.check),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Game(ruta: _rutas[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
          itemCount: _rutas.length,
        ),*/
          ),
    );
  }
}
