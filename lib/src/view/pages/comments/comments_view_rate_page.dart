import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_component/generated/l10n.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile_component/src/logic/models/score_model.dart';
import 'package:mobile_component/src/logic/provider/graphql_provider.dart';
import 'package:mobile_component/src/logic/bloc/comments_bloc.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:mobile_component/src/view/pages/comments/comments_page.dart';

import 'package:mobile_component/src/view/widgets/shared/utils/button_widget.dart';
import 'package:mobile_component/src/view/widgets/shared/view/botton_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/src/provider.dart';

class CommentsViewRatePage extends StatefulWidget {
  const CommentsViewRatePage({Key? key}) : super(key: key);

  @override
  _CommentsViewRatePageState createState() => _CommentsViewRatePageState();
}

class _CommentsViewRatePageState extends State<CommentsViewRatePage> {
  GraphqlClass graphqlClass = GraphqlClass();

  @override
  Widget build(BuildContext context) {
    CommentsBloc commentsBloc = context.read<ProviderBlocs>().comments;
    List<Score> scores = [];
    if (commentsBloc.isMovie!) {
      for (var score in commentsBloc.moviesScore!) {
        if (commentsBloc.movieSerieSelected == score.moiveSerieName) {
          scores.add(score);
        }
      }
    } else {
      for (var score in commentsBloc.seriesScore!) {
        if (commentsBloc.movieSerieSelected == score.moiveSerieName) {
          scores.add(score);
        }
      }
    }
    for (var a in scores) {
      print(a.score);
    }

    return WillPopScope(
      onWillPop: () {
        return Navigator.maybePop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'comments');
            },
            child: const Icon(
              Icons.arrow_back_ios_new, // add custom icons also
            ),
          ),
          title: Text('UNetflix'),
          backgroundColor: Colors.red,
          elevation: 2,
        ),
        body: body(context, commentsBloc, scores),
      ),
    );
  }

  body(BuildContext context, CommentsBloc commentsBloc, scores) {
    return ListView(
      children: _crearItems(scores, commentsBloc),
    );
  }

  Widget _comment(Score score) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Score ' + score.score.toString()),
          Text('Username ' + score.username),
          Text('description ' + score.description),
        ],
      ),
    );
  }

  List<Widget> _crearItems(List<Score> scores, commentsBloc) {
    List<Widget> lista = [];
    lista.add(
      Text(
        "Rate of ${commentsBloc.movieSerieSelected}",
        style: const TextStyle(
          fontSize: 30,
          fontFamily: 'OpenSans',
          color: Color.fromRGBO(9, 5, 28, 1),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    lista.add(
      const Padding(
        padding: EdgeInsets.only(top: 10, right: 20, left: 10),
        child: Text(
          'Comments: ',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
    for (var element in scores) {
      final tempWidget = _comment(element);
      lista.add(tempWidget);
    }
    return lista;
  }
}
