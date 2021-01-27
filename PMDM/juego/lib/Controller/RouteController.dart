import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:juego/Models/Ruta.dart';

Future<List<Ruta>> fetchRuta() async {
  final response = await http.get('http://10.0.2.2:8080/rutas/todas');
  var rutas = List<Ruta>();
  if (response.statusCode == 200) {
    var ruta = json.decode(response.body);
    for (var rutes in ruta) {
      rutas.add(Ruta.fromJson(rutes));
    }
  }

  return rutas;
}

/*
class Rutas {
  String id;
  String posterPath;
  int km;
  String nombre;
  String ciudad;
  String duracion;
  List<String> lista_puntos;
  int puntos;
  String descripcion;

  Rutas({
    this.km,
    this.id,
    this.nombre,
    this.ciudad,
    this.duracion,
    this.lista_puntos,
    this.puntos,
    this.posterPath,
    this.descripcion,
  });

  Rutas.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    nombre = json['nombre'] as String;
    ciudad = json['ciudad'] as String;
    duracion = json['duracion'] as String;
    puntos = json['puntos'] as int;
    lista_puntos = json['lista_puntos'] as List;
    descripcion = json['descripcion'] as String;
    km = json['km'] as int;
    puntos.toString();
    km.toString();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Ruta>>(
        future: fetchRuta(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(ruta: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Ruta> ruta;

  PhotosList({Key key, this.ruta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: ruta.length,
      itemBuilder: (context, index) {
        return Text(ruta[index].toString());
      },
    );
  }
}*/
