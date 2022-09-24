import 'package:flutter/material.dart';
import 'package:proyecto_app_final/models/model.dart';

class Reviers extends StatelessWidget {
  const Reviers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Cast cast = ModalRoute.of(context)!.settings.arguments as Cast;

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[_ReviersCast(cast)]),
    );
  }
}

class _ReviersCast extends StatelessWidget {
  final Cast cast;
  _ReviersCast(Cast this.cast);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(children: [
        Text(
          cast.knownForDepartment,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          cast.name,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          cast.originalName,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ]),
    );
  }
}
