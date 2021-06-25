import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static final HttpLink httpLink = HttpLink(
    'https://swapi-graphql.netlify.app/.netlify/functions/index',
  );
  static String? _token;
  static final AuthLink authLink = AuthLink(getToken: () => _token);
  static final Link link = authLink.concat(httpLink);
  static ValueNotifier<GraphQLClient> initializeClient(String token) {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return client;
  }
}
