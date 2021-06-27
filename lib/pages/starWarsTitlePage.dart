import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starwars_graphql/model/filmModel.dart';
import 'package:starwars_graphql/graphQLQuery.dart';
import 'package:starwars_graphql/model/speciesModel.dart';
import 'package:starwars_graphql/pages/starsWarsDetailsPage.dart';

class StarWarsTitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars Movies'),
      ),
      body: SafeArea(
        child: Query(
          options: QueryOptions(document: gql(GraphQLQuery.getMovieTitle)),
          builder: (
            QueryResult result, {
            Refetch? refetch,
            FetchMore? fetchMore,
          }) {
            if (result.isLoading) {
              return CircularProgressIndicator();
            }
            if (result.hasException) {
              print(result.exception);
              return Text(result.exception.toString());
            }
            List<List<SpeciesModel>> speciesModelList = [];
            List filmList = result.data!['allFilms']['films'];
            filmList.forEach((element) {
              List species = element['speciesConnection']['species'];
              speciesModelList
                  .add(species.map((e) => SpeciesModel.fromJson(e)).toList());
            });

            List<FilmModel> filmModelList =
                filmList.map((e) => FilmModel.fromJson(e)).toList();
            return ListView.builder(
                shrinkWrap: true,
                itemCount: filmModelList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return StarsWarsDetailsPage(
                              filmModel: filmModelList[index],
                              speciesModelList: speciesModelList[index],
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(6),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(filmModelList[index].title!),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
