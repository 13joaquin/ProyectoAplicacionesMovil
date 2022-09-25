import 'package:flutter/material.dart';
import 'package:proyecto_app_final/models/movie.dart';
import 'package:proyecto_app_final/widgets/top_rated_list.dart';
import 'package:proyecto_app_final/models/Top_rated.dart';
import 'dart:async';
import 'dart:convert';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centro de Votaciones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VotacionesSliderExample(),
    );
  }
}

class VotacionesSliderExample extends StatefulWidget {
  @override
  _VotacionesSta createState() => _VotacionesSta();
}

class _VotacionesSta extends State<VotacionesSliderExample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SfTreemap(
        dataCount: _VotacionesSta,
        weightValueMapper: (int index) {
          return _VotacionesSta[index].totalVoters;
        },
        colorMappers: _colorMappers,
        levels: [
          TreemapLevel(
              groupMapper: (int index) => [index].state,
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
                return _VotacionesSta[tile.indices[0]].party;
              },

              // Enable the tooltip.
              tooltipBuilder: (BuildContext context, TreemapTile tile) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                          text: _VotacionesSta[tile.indices[0]].candidate,
                          children: [
                        TextSpan(
                          text: 'n${tile.group}',
                        ),
                        TextSpan(
                          text: 'nWon percentage : ' +
                              _VotacionesSta[tile.indices[0]]
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
