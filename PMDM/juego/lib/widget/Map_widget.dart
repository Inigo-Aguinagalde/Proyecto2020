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
            ),
          );
        });
    };

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    Completer<GoogleMapController> _controller = Completer();
    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

    /*if (_currentPosition == null) {
      return GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(43.346868, -1.796799),
          zoom: 15,
        ),
      );
    } else {*/
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
    //}
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
