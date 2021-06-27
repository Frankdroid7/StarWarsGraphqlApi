class SpeciesModel {
  String? name;
  String? language;
  String? designation;
  int? averageLifespan;
  String? classification;

  SpeciesModel({
    this.name,
    this.language,
    this.designation,
    this.classification,
    this.averageLifespan,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      name: json['name'],
      language: json['language'],
      designation: json['designation'],
      classification: json['classification'],
      averageLifespan: json['averageLifespan'],
    );
  }
}
