import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juego/Models/Ranking.dart';

class RankingView extends StatefulWidget {
  RankingView({Key key, this.ranking}) : super(key: key);
  List<Ranking> ranking;

  @override
  _Ranking createState() => _Ranking();
}

class _Ranking extends State<RankingView> {
  List<Widget> _ranking = new List<Widget>();
  @override
  void initState() {
    for (Ranking data in widget.ranking) {
      setState(() {
        _ranking.add(Container(
          child: Row(
            children: [Text(data.puntuacion.toString()), Text(data.idUsuario)],
          ),
        ));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ranking"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[_ranking[0]],
        ),
      ),
    );
  }
}
