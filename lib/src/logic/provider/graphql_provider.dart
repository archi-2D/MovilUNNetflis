import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';

class GraphqlClass {
  static HttpLink httpLink = HttpLink(dotenv.env['GRAPHLURL'].toString());
  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(link: httpLink, cache: GraphQLCache(store: null));
  }
}
