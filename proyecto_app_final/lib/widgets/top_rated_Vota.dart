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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SfTreemap(
        dataCount: Movie(voteAverage: voteAverage, voteCount: voteCount).length,
        weightValueMapper: (int index) {
          return _MovieListState[index].totalVoters;
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
