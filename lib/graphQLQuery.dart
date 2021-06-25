class GraphQLQuery {
  static String getMovieTitle = """
  query{
  allFilms{
    films{
      title
      episodeID
      director
      producers,
      releaseDate,
      created
    }
  }
}
  """;
}
