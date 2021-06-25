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
      client: Config.initializeClient(token),
      child: MaterialApp(
        title: 'Star Wars Movie App',
        home: StarWarsTitlePage(),
      ),
    );
  }
}

String token =
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJpYnVrdW5vbGFkaXBvMjAxNUBnbWFpbC5jb20iLCJuYW1lIjoiaWJ1a3Vub2xhZGlwbzIwMTUiLCJpYXQiOjE2MjQ2NTQyNzYuMjQsImlzcyI6Imh0dHBzOi8vaGFzdXJhLmlvL2xlYXJuLyIsImh0dHBzOi8vaGFzdXJhLmlvL2p3dC9jbGFpbXMiOnsieC1oYXN1cmEtYWxsb3dlZC1yb2xlcyI6WyJ1c2VyIl0sIngtaGFzdXJhLXVzZXItaWQiOiJpYnVrdW5vbGFkaXBvMjAxNUBnbWFpbC5jb20iLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIifSwiZXhwIjoxNjI0NzQwNjc2fQ.JBOEeGotXly1NJTpw8vjvVYEReFBRW1sEx9w9Rdd4kU';
