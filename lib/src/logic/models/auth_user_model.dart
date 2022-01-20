import 'dart:convert';

class AuthUser {
  final String firstName;
  final String token;

  AuthUser(this.firstName, this.token);

  AuthUser.fromJson(Map<dynamic, dynamic> json)
      : firstName = json['firstName'],
        token = json['token'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'firstName': firstName,
        'token': token,
      };
}