import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mobile_component/src/logic/models/auth_user_model.dart';

class LoginLogic {
  verifyUser(graphqlClass) async {
    GraphQLClient client = graphqlClass.clientToQuery();
    String document = """
      mutation{
        verifyUser(authUser: {
          username: "Utest1",
          password: "seb123456"
        })
      }"""
    ;
    QueryResult result =
        await client.query(QueryOptions(document: gql(document)));

    var b = result.data!.values.elementAt(1);

    AuthUser authUser = AuthUser.fromJson(b);
    print(authUser.firstName);
  }  

  createUser(graphqlClass) async {
    GraphQLClient client = graphqlClass.clientToQuery();
    String document = """
     mutation{
      createAuthUser(authCreateUser: {
        username:"Utest1",
        firstName: "test1",
        lastName: "Ltest1",
        password: "seb123456",      
      })"""
    ;
    QueryResult result =
        await client.query(QueryOptions(document: gql(document)));

    var b = result.data!.values.elementAt(1);

    // ignore: curly_braces_in_flow_control_structures
    if(b=="El usuario fue creado"){
      print('Nice');
    }else{
      print('Desnice');
    }
  }  
}
