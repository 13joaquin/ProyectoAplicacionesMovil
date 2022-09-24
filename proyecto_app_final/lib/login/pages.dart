import 'dart:html';

import 'package:flutter/material.dart';
import 'package:proyecto_app_final/models/movie.dart';
import 'package:proyecto_app_final/screens/home_screen.dart';

class Pintar extends StatefulWidget {
  @override
  _PintarState createState() => _PintarState();
}

class _PintarState extends State<Pintar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login oKi'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('Hello Bienvenido'),
          ),
          RaisedButton(child: Text("Ir a al Home"), onPressed: () => {
            Navigator.push(context, MaterialPageRouter(build(context)=> HomeScreen()))
          })
        ],
      ),
    );
  }
}
