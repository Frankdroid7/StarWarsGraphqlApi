import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starwars_graphql/config.dart';
import 'package:starwars_graphql/pages/starWarsTitlePage.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Config.initializeClient(),
      child: MaterialApp(
        title: 'Star Wars Movie App',
        home: StarWarsTitlePage(),
      ),
    );
  }
}
