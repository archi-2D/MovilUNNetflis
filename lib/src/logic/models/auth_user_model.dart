import 'dart:convert';

class AuthUser {
  final String token;
  final String error;

  AuthUser(this.token, this.error);

  AuthUser.fromJson(Map<dynamic, dynamic> json)
      : token = json['msj'],
        error = json['error'];

  Map<dynamic, dynamic> toJson() =>
      <dynamic, dynamic>{'token': token, 'error': error};
}
