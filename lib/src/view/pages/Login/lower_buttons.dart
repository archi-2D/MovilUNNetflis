import 'package:flutter/material.dart';
import 'package:mobile_component/generated/l10n.dart';
import 'package:mobile_component/src/logic/bloc/app_bloc.dart';
import 'package:mobile_component/src/logic/bloc/login_bloc.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:provider/src/provider.dart';

class ButtonsWidget extends StatelessWidget {
  final LoginBloc bloc;

  ButtonsWidget({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = context.read<ProviderBlocs>().appBloc;
    return StreamBuilder(
      stream: bloc.validateBasicForm,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FloatingActionButton.extended(
          heroTag: "login",
          backgroundColor: snapshot.hasData
              ? const Color.fromRGBO(83, 232, 139, 1)
              : Colors.grey[400],
          onPressed: () => {
            appBloc.changePage(0),
            Navigator.pushReplacementNamed(context, 'home')
          },
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
