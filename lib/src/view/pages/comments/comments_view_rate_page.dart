import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_component/generated/l10n.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
          backgroundColor: Colors.white54,
          elevation: 2,
        ),
        body: body(context, commentsBloc),
      ),
    );
  }

  Stack body(BuildContext context, CommentsBloc commentsBloc) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              /*Text(
                dotenv.env['GRAPHLURL'].toString(),
              ),
              ButtomWidget(
                disableColor: Colors.grey,
                enebleColor: Colors.blue,
                function: () {
                  a();
                },
                text: 'asd',
              ),*/
              // ignore: prefer_const_constructors
              Text(
                "Rate of ${commentsBloc.movieSerieSelected}",
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'OpenSans',
                  color: Color.fromRGBO(9, 5, 28, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 10),
                  child: Text('This is the rate of the tittle in the plataform',
                      style: TextStyle(fontSize: 23))),
              const Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 10),
                  child: Text('Score: (Acá iria lo de la busqueda)',
                      style: TextStyle(fontSize: 20))),
              const Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 10),
                  child: Text('Comment: (Acá iria lo de la busqueda)',
                      style: TextStyle(fontSize: 20)))
            ],
          ),
        )
      ],
    );
  }

  Column form(CommentsBloc commentBloc) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              //hintText: "Your Name",
              labelText: 'Score the movie from 1-5',
              labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              //disabledBorder: InputBorder.none,
              //fillColor: Colors.black12,
              contentPadding: const EdgeInsets.all(16),
              filled: true,

              prefixIcon: const Icon(
                Icons.score,
                color: Colors.grey,
              ),
            ),
            onChanged: (value) => {
              commentBloc.changeScore(value),
            },
            obscureText: false,
            //maxLength: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              //hintText: "Your Name",""
              labelText: "Comment of your rate",
              labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              //disabledBorder: InputBorder.none,
              //fillColor: Colors.black12,
              contentPadding: const EdgeInsets.all(16),
              filled: true,

              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
            onChanged: (value) => {
              commentBloc.changeDescription(value),
            },
            obscureText: false,
            //maxLength: 20,
          ),
        ),
      ],
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
}
