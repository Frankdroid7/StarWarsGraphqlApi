class FilmModel {
  String? title;
  int? episodeID;
  String? director;
  String? releaseDate;
  List<String>? producers;

  FilmModel({
    this.title,
    this.director,
    this.episodeID,
    this.producers,
    this.releaseDate,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
        title: json['title'],
        director: json['director'],
        episodeID: json['episodeID'],
        releaseDate: json['releaseDate']);
        producers: json['producers'].cast<String>()
  }
}
