import 'package:starwars_graphql/model/speciesModel.dart';

class FilmModel {
  String? title;
  int? episodeID;
  String? director;
  String? releaseDate;
  List<String>? producers;
  List<String>? speciesName;

  FilmModel({
    this.title,
    this.director,
    this.episodeID,
    this.producers,
    this.releaseDate,
    this.speciesName,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      title: json['title'],
      episodeID: json['episodeID'],
      director: json['director'],
      releaseDate: json['releaseDate'],
      producers: json['producers'].cast<String>(),
    );
  }
}
