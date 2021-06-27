import 'package:flutter/material.dart';
import 'package:starwars_graphql/model/filmModel.dart';
import 'package:starwars_graphql/model/speciesModel.dart';

class StarsWarsDetailsPage extends StatelessWidget {
  FilmModel? filmModel;
  List<SpeciesModel>? speciesModelList;

  StarsWarsDetailsPage({this.filmModel, this.speciesModelList});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars Movie Details'),
      ),
      body: SafeArea(
        child: Card(
          child: SingleChildScrollView(
            child: Center(
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
                  Text(
                    filmModel!.director!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                      children:
                          List.generate(filmModel!.producers!.length, (index) {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Species'),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      speciesModelList!.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: deviceWidth / 2),
                            child: Text(index.toString()),
                          ),
                          SpeciesWidget(
                            title: 'Name',
                            deviceWidth: deviceWidth,
                            value: speciesModelList![index].name!,
                          ),
                          SpeciesWidget(
                            title: 'Language',
                            deviceWidth: deviceWidth,
                            value: speciesModelList![index].language!,
                          ),
                          SpeciesWidget(
                            title: 'Designation',
                            deviceWidth: deviceWidth,
                            value: speciesModelList![index].designation!,
                          ),
                          SpeciesWidget(
                            title: 'Classification',
                            deviceWidth: deviceWidth,
                            value: speciesModelList![index].classification!,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpeciesWidget extends StatelessWidget {
  final String title;
  final String value;
  final double deviceWidth;

  SpeciesWidget({
    required this.title,
    required this.value,
    required this.deviceWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: deviceWidth / 2 - 80),
      child: Row(
        children: [
          Text('$title:  '),
          Text(
            value.contains('/') ? 'NONE' : value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
