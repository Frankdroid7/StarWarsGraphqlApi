class GraphQLQuery {
  static String getMovieTitle = """
 query fetchMovies {
  allFilms {
    films {
      title
      episodeID
      director
      producers
      releaseDate
      episodeID
      speciesConnection {
        species {
          name
          language
          designation
          classification
          averageLifespan
        }
      }
    }
  }
}

  """;
}
