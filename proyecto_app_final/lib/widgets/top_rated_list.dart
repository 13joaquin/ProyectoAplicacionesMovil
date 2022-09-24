import 'package:flutter/material.dart';
import 'package:proyecto_app_final/models/model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieListState();
  }
}

Future<Map> getJson() async {
  var url =
      'http://api.themoviedb.org/3/discover/movie?api_key=YOUR_KEY_HERE'; // This is a deprecated API as the website has been shut down
  var response = await http.get(url);
  return json.decode(response.body);
}

class _MovieListState extends State<MovieList> {
  var movies;
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson();
    setState(() {
      movies = data['results'];
    });
  }
}

@override
Widget build(BuildContext context) {
  getData();
  return Scaffold(
    appBar: new AppBar(
      centerTitle: true,
      elevation: 0.4,
      leading: Icon(
        Icons.arrow_back,
        color: mainColor,
      ),
      backgroundColor: Colors.white,
      title: new Text(
        'Movies',
        style: new TextStyle(
          color: mainColor,
          fontFamily: 'Sniglet',
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        new Icon(
          Icons.menu,
          color: mainColor,
        )
      ],
    ),
    body: new Padding(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new MovieTitle(mainColor),
          new Expanded(
              child: new ListView.builder(
                  itemCount: movies == null ? 0 : movies.length,
                  itemBuilder: (context, i) {
                    return new FlatButton(
                      padding: const EdgeInsets.all(0.0),
                      child: new MovieCell(movies, i),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new MovieDetail(movies[i]);
                        }));
                      },
                      color: Colors.white,
                    );
                  }))
        ],
      ),
    ),
  );
}

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'Top Rated',
        style: new TextStyle(
          color: mainColor,
          fontFamily: 'Sniglet',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
                child: new Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new NetworkImage(
                          image_url + movies[i]['poster_path']),
                      fit: BoxFit.cover),
                  boxShadow: [
                    new BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            new Expanded(
                child: new Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: new Column(
                children: [
                  new Text(
                    movies[i]['title'],
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Sniglet',
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0)),
                  new Text(
                    movies[i]['overview'],
                    maxLines: 3,
                    style: new TextStyle(
                        color: const Color(0xff8785A4), fontFamily: 'Sniglet'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )),
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SfTreemap(
        dataCount: _MovieListState.length,
        weightValueMapper: (int index) {
          return _MovieListState[index].totalVoters;
        },
        colorMappers: _colorMappers,
        levels: [
          TreemapLevel(
              groupMapper: (int index) => _MovieListState[index].state,
              labelBuilder: (BuildContext context, TreemapTile tile) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tile.group,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              colorValueMapper: (TreemapTile tile) {
                return _MovieListState[tile.indices[0]].party;
              },

              // Enable the tooltip.
              tooltipBuilder: (BuildContext context, TreemapTile tile) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                          text: _MovieListState[tile.indices[0]].candidate,
                          children: [
                        TextSpan(
                          text: 'n${tile.group}',
                        ),
                        TextSpan(
                          text: 'nWon percentage : ' +
                              __MovieListState[tile.indices[0]]
                                  .percentage
                                  .toString() +
                              '%',
                        ),
                      ])),
                );
              }),
        ],
        legend: TreemapLegend.bar(
          position: TreemapLegendPosition.bottom,
          segmentSize: const Size(80.0, 12.0),
        ),
      ),
    );
  }
}
