import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile_component/src/logic/provider/graphql_provider.dart';

import 'package:mobile_component/src/view/widgets/shared/utils/button_widget.dart';
import 'package:mobile_component/src/view/widgets/shared/view/botton_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  GraphqlClass graphqlClass = GraphqlClass();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.maybePop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          elevation: 2,
        ),
        body: body(context),
        bottomNavigationBar: const BottonBar(),
      ),
    );
  }

  Stack body(context) {
    return Stack(
      children: [
        Container(
          color: Colors.black45,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                dotenv.env['GRAPHLURL'].toString(),
              ),
              ButtomWidget(
                disableColor: Colors.grey,
                enebleColor: Colors.blue,
                function: () {
                  a();
                },
                text: 'asd',
              ),
            ],
          ),
        )
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
