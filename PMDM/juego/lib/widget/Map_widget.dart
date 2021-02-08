import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:juego/Controller/RouteController.dart';
import 'package:juego/Controller/UserController.dart';
import 'package:juego/Models/Localizaciones.dart';
import 'package:juego/Models/Usuarios.dart';
import 'package:juego/Providers/ContadorPuntos.dart';
import 'package:provider/provider.dart';
import 'package:juego/views/Game_view.dart';

// ignore: must_be_immutable
class Mapa extends StatefulWidget {
  Mapa({this.user_id, this.ruta_id, this.localizaciones, Key key})
      : super(key: key);
  List<Localizaciones> localizaciones;
  String user_id;
  String ruta_id;

  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  Set<Marker> _markers = new Set<Marker>();
  Position _currentPosition;

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (Localizaciones loc in widget.localizaciones) {
      setState(() {
        _markers.add(
          Marker(
              markerId: MarkerId(loc.id),
              position: LatLng(loc.latitud, loc.longitud),
              infoWindow: InfoWindow(title: loc.nombre),
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.blueAccent[100],
                      title: Text("¿" + loc.pregunta),
                      content: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      _contestacionPregunta(
                                          loc.id, loc.solucion, 1);
                                    },
                                    child: Text(loc.respuesta1),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      _contestacionPregunta(
                                          loc.id, loc.solucion, 2);
                                    },
                                    child: Text(loc.respuesta2),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      _contestacionPregunta(
                                          loc.id, loc.solucion, 3);
                                    },
                                    child: Text(loc.respuesta3),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        );
      });
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Completer<GoogleMapController> _controller = Completer();
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    return GoogleMap(
      markers: _markers,
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        zoom: 15,
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print("lat:" +
            _currentPosition.latitude.toString() +
            "lng:" +
            _currentPosition.longitude.toString());
      });
    }).catchError((e) {
      print(e);
    });
    print(_currentPosition);
  }

  _contestacionPregunta(String id, int correct, int resp) {
    if (correct == resp) {
      Provider.of<ContadorPuntos>(context, listen: false).incrementPuntos();
    }
    Provider.of<ContadorPuntos>(context, listen: false).increment_Cont();
    Provider.of<ContadorPuntos>(context, listen: false)
        .setPorcentaje(widget.localizaciones.length);
    Navigator.of(context, rootNavigator: true).pop('dialog');
    int contestadas =
        Provider.of<ContadorPuntos>(context, listen: false).getContestadas;

    if (contestadas == widget.localizaciones.length) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.blueAccent[100],
              title: Text("Felizidades!!! Has finalizado la ruta!!"),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                      ),
                      onPressed: () {
                        _guardarPuntos();
                      },
                      child: Text("Ranking"),
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }

  _guardarPuntos() {
    double puntos =
        Provider.of<ContadorPuntos>(context, listen: false).getPuntos;
    //addRankingUser(puntos, widget.ruta_id, widget.user_id);
    deleteRutaActiva(widget.user_id);
  }
}
