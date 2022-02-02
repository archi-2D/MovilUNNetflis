// ignore_for_file: argument_type_not_assignable_to_error_handler

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:mobile_component/generated/l10n.dart';
import 'package:mobile_component/src/logic/bloc/app_bloc.dart';
import 'package:mobile_component/src/logic/bloc/login_bloc.dart';
import 'package:mobile_component/src/logic/models/auth_user_model.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:mobile_component/src/view/pages/Login/lower_buttons.dart';

//import 'package:flutter_svg/svg.dart';

import 'package:provider/src/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthUser authUser;
  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.read<ProviderBlocs>().login;
    AppBloc appBloc = context.read<ProviderBlocs>().appBloc;
    return WillPopScope(
      onWillPop: () {
        return Navigator.maybePop(context);
      },
      child: Scaffold(
        body: body(context, loginBloc, appBloc),
      ),
    );
  }

  Stack body(BuildContext context, LoginBloc loginBloc, AppBloc appBloc) {
    String document = """
    mutation verifyUser (\$authUser:AuthUser!){
  verifyUser(authUser:\$authUser){
    msj
    error
  }
}
""";
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              _imageLogo(),
              Text(
                S.of(context).login_title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  color: Color.fromRGBO(9, 5, 28, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Mutation(
                  options: MutationOptions(
                    document: gql(document),
                    onCompleted: (data) => {
                      authUser = AuthUser.fromJson(data.values.elementAt(1)),
                      if (authUser.error == 'No Error')
                        {
                          appBloc.changePage(0),
                          appBloc.changeToken(authUser.token),
                          appBloc.changeUsername(loginBloc.userName!),
                          loginBloc.changePassword(''),
                          Navigator.pushReplacementNamed(context, 'home'),
                        }
                      else
                        {_showMaterialDialog()}
                    },
                  ),
                  builder: (RunMutation runMutation, QueryResult? result) {
                    return Column(
                      children: [
                        form(loginBloc),
                        _forgotPassword(),
                        _paddingField(ButtonsWidget(
                          bloc: loginBloc,
                          function: () => runMutation({
                            "authUser": {
                              "username": loginBloc.userName,
                              "password": loginBloc.password
                            }
                          }),
                        ))
                      ],
                    );
                  }),
              _createAccount(),
            ],
          ),
        )
      ],
    );
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Invaid username or password'),
            actions: [
              TextButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: const Text('Acept'))
            ],
          );
        });
  }

  Container _forgotPassword() {
    TextStyle linkStyle = const TextStyle(
      fontSize: 14,
      fontFamily: 'OpenSans',
      color: Color.fromRGBO(83, 232, 139, 1),
      fontWeight: FontWeight.w400,
    );
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Forgot your password?',
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, 'forgotPass');
                      }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _createAccount() {
    TextStyle defaultStyle = const TextStyle(
      fontSize: 14,
      fontFamily: 'OpenSans',
      color: Color.fromRGBO(9, 5, 28, 1),
      fontWeight: FontWeight.w400,
    );
    TextStyle linkStyle = const TextStyle(
      fontSize: 14,
      fontFamily: 'OpenSans',
      color: Color.fromRGBO(83, 232, 139, 1),
      fontWeight: FontWeight.w400,
    );
    return Container(
      padding: const EdgeInsets.only(top: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: defaultStyle,
              children: <TextSpan>[
                const TextSpan(text: 'Don\'t have an account? '),
                TextSpan(
                    text: 'Create a new account',
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, 'register');
                      }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _imageLogo() {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Image.asset(
          'assets/img/logo.png',
          height: 150,
        ),
      ),
    );
  }

  Column form(LoginBloc loginBloc) {
    return Column(
      children: [
        _paddingField(_emailField(loginBloc)),
        //_paddingField(_phoneField(loginBloc)),
        _paddingField(_passwordField(loginBloc)),
      ],
    );
  }

  Widget _paddingField(Widget field) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: field);
  }

  InputDecoration _decorationField(String labelTextField, Icon iconField) {
    return InputDecoration(
      labelText: labelTextField,
      labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      filled: true,
      prefixIcon: iconField,
    );
  }

  Widget _emailField(LoginBloc loginBloc) {
    return TextField(
      decoration: _decorationField(
          'username',
          const Icon(
            Icons.email,
            color: Colors.grey,
          )),
      onChanged: (value) => {
        loginBloc.changeuserName(value),
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _passwordField(LoginBloc loginBloc) {
    return TextField(
      decoration: _decorationField(
          S.of(context).login_password_field_label,
          const Icon(
            Icons.password,
            color: Colors.grey,
          )),
      onChanged: (value) => {
        loginBloc.changePassword(value),
      },
      obscureText: true,
    );
  }
}
