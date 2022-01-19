import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile_component/src/logic/provider/graphql_provider.dart';
import 'package:mobile_component/src/logic/bloc/comments_bloc.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:mobile_component/src/view/pages/comments/comments_logic.dart';
import 'package:mobile_component/src/view/pages/comments/comments_rate_page.dart';
import 'package:mobile_component/src/view/pages/comments/comments_view_rate_page.dart';

import 'package:mobile_component/src/view/widgets/shared/view/botton_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/src/provider.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class User {
  String username;
  String mediaName;
  User({required this.username, required this.mediaName});
}

class _CommentsPageState extends State<CommentsPage> {
  GraphqlClass graphqlClass = GraphqlClass();
  CommentsLogic commentsLogic = CommentsLogic();
  late CommentsBloc commentsBloc;
  final user = User(mediaName: 'unknown', username: 'unknown');
  @override
  Widget build(BuildContext context) {
    commentsBloc = context.read<ProviderBlocs>().comments;
    return WillPopScope(
      onWillPop: () {
        return Navigator.maybePop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('UNetflix - Opinions'),
          backgroundColor: Colors.red,
          elevation: 2,
        ),
        backgroundColor: Colors.redAccent,
        body: body(context),
        bottomNavigationBar: const BottonBar(),
      ),
    );
  }

  Stack body(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Movies",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  _card("Encanto"),
                  _card("Mr Nobody")
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Series",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  _card("The Witcher"),
                  _card("Mr Robot")
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _card(String name) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 23, color: Colors.white),
            ),
            _imageLogo(name),
            _buttons(name)
          ],
        ));
  }

  Widget _buttons(String name) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_rateButton(name), _viewRateButton(name)],
        ));
  }

  Widget _rateButton(String name) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.black54,
          ),
          onPressed: () {
            commentsBloc.changeMovieSerieSelected(name);
            Navigator.pushReplacementNamed(context, 'comments/rate');
          },
          child: const Text('Rate', style: TextStyle(fontSize: 15)),
        ));
  }

  Widget _viewRateButton(String name) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.black54,
          ),
          onPressed: () {
            user.mediaName = name;
            commentsLogic.getMoviesScore(graphqlClass);
            commentsBloc.changeMovieSerieSelected(name);
            Navigator.pushReplacementNamed(context, 'comments/viewRate');
          },
          child: const Text('view rate', style: TextStyle(fontSize: 15)),
        ));
  }

  Container _imageLogo(String name) {
    var location = 'assets/img/' + noWhiteSpaces(name) + '.jpg';
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Image.asset(
          location,
          height: 100,
        ),
      ),
    );
  }

  a() async {
    GraphQLClient client = graphqlClass.clientToQuery();
    String document = """
query {
  getUsers{
      id
  }
}
""";
    QueryResult result =
        await client.query(QueryOptions(document: gql(document)));
    String responseDetails = getPrettyJSONString(result.data);
    var response = jsonDecode(responseDetails);
    setState(() {});
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

  String noWhiteSpaces(String word) {
    String newS = '';
    for (int i = 0; i < word.length; i++) {
      if (!word[i].contains(' ')) {
        newS = newS + word[i];
      }
    }
    return newS;
  }
}
