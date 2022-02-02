import 'package:flutter/material.dart';
import 'package:mobile_component/generated/l10n.dart';
import 'package:mobile_component/src/logic/bloc/app_bloc.dart';
import 'package:mobile_component/src/logic/bloc/login_bloc.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:provider/src/provider.dart';

class ButtonsWidget extends StatefulWidget {
  final LoginBloc bloc;
  final function;

  ButtonsWidget({Key? key, required this.bloc, required this.function})
      : super(key: key);

  @override
  State<ButtonsWidget> createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.validateBasicForm,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FloatingActionButton.extended(
          heroTag: "login",
          backgroundColor: snapshot.hasData
              ? const Color.fromRGBO(83, 232, 139, 1)
              : Colors.grey[400],
          onPressed: snapshot.hasData ? widget.function : null,
          label: Text(
            S.of(context).login_button_login,
            style: const TextStyle(
                fontFamily: 'OpenSans', fontWeight: FontWeight.w900),
          ),
        );
      },
    );
  }
}
