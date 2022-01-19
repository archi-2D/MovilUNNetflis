import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile_component/src/logic/models/score_model.dart';

class CommentsLogic {
  example(graphqlClass) async {
    GraphQLClient client = graphqlClass.clientToQuery();
    String document = """
query {
  getUsers{
      user_name
      firstName
  }
}
""";
    QueryResult result =
        await client.query(QueryOptions(document: gql(document)));
    String responseDetails = getPrettyJSONString(result.data);
    var response = jsonDecode(responseDetails);

    var b = result.data!.values.iterator;

    while (b.moveNext()) {
      print(b.current.toString());
    }
    var c = result.data!.values.elementAt(1);
    print(c[1]);
    //print(response);
  }

  String getPrettyJSONString(jsonObject) {
    var encoder = const JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }

  getMoviesScore(graphqlClass) async {
    GraphQLClient client = graphqlClass.clientToQuery();
    String document = """
query {
  getMoviesScore{
    user_name
    moive_serie_name
    score
    description
  }
}
""";
    List<Score> scoreList = [];
    QueryResult result =
        await client.query(QueryOptions(document: gql(document)));

    var scores = result.data!.values.elementAt(1);
    for (var scroeApi in scores) {
      scoreList.add(Score.fromJson(scroeApi));
    }
    for (var scroel in scoreList) {
      print(scroel.username);
      print(scroel.moiveSerieName);
    }

    //print(response);
  }
}
