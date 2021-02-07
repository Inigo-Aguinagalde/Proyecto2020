import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:juego/Models/Localizaciones.dart';

// ignore: must_be_immutable
class Mapa extends StatefulWidget {
  Mapa({this.localizaciones, Key key}) : super(key: key);
  List<Localizaciones> localizaciones;

  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  Set<Marker> _markers = new Set<Marker>();
  Position _currentPosition ;

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
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.blueAccent[100],
                      title: Text("¿"+loc.pregunta),
                      content: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded( 
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      _contestacionPregunta();
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
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      _contestacionPregunta();
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
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      _contestacionPregunta();
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
              }
            ),
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

  _getCurrentLocation(){
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position){
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

  _contestacionPregunta(){
    /* 
      Recibe dos variables la el numero de la respuesta (1,2,3) y el resultado correcto, Esta función las compara si es la respuesta correcta tendrá que subir el punto en el PROVIDER que hay que crear.

    */
  }

  _cancelarRutaActiva(){
    /* 
      Este tendrá que eliminar al campo de Ruta activa de la BD del usuario logeado. Aparte de eso tendrá que eliminar los datos del provider.
    */
  }
}
