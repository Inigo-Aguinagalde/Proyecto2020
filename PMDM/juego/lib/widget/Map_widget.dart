import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:juego/Controller/LocalizacionesController.dart';
import 'package:juego/Models/Localizaciones.dart';

// ignore: must_be_immutable
class Mapa extends StatefulWidget {
  Mapa( {this.localizaciones, Key key}) : super(key: key);
  List<dynamic> localizaciones;

  @override
  _Mapa createState() => _Mapa();
}

class _Mapa extends State<Mapa> {
  Position _currentPosition;
  List<dynamic> data_list_loc;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Completer<GoogleMapController> _controller = Completer();
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    print(widget.localizaciones.toString());
    
    /*for(var i=0;i<widget.localizaciones.length;i++){
      fetchLoc(widget.localizaciones[i].toString()).then((value) {
        setState(() {
          print(value);
          //data_list_loc.add(value);
        });
      });
    }*/

    if (_currentPosition == null) {
      return GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(43.346868, -1.796799),
          zoom: 15,
        ),
      );
    } else {
      return GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          zoom: 15,
        ),
      );
    }
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
}
