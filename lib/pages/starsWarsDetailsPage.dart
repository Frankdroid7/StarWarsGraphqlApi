import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starwars_graphql/filmModel.dart';

class StarsWarsDetailsPage extends StatelessWidget {
  FilmModel? filmModel;
  StarsWarsDetailsPage({this.filmModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars Movie'),
      ),
      body: SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Producers'),
                    ),
                    Text(
                      filmModel!.title!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Director'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        filmModel!.director!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Episode ID'),
                    ),
                    Text(
                      filmModel!.episodeID!.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Producers'),
                    ),
                    Container(
                      height: 40,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(filmModel!.producers!.length,
                            (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              filmModel!.producers!.length == index + 1
                                  ? '${filmModel!.producers![index]}.'
                                  : '${filmModel!.producers![index]},',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
