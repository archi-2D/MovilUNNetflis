import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mobile_component/generated/l10n.dart';
import 'package:mobile_component/src/logic/bloc/register_bloc.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:mobile_component/src/view/pages/Register/register_logic.dart';
import 'package:mobile_component/src/view/widgets/shared/utils/button_widget.dart';
import 'package:provider/src/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterLogic registerLogic = RegisterLogic();
  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = context.read<ProviderBlocs>().register;

    return WillPopScope(
      onWillPop: () {
        return Navigator.maybePop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              registerLogic.cleanRegisterBolc(registerBloc);
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Icon(
              Icons.arrow_back_ios_new, // add custom icons also
            ),
          ),
          backgroundColor: Colors.white54,
          elevation: 2,
        ),
        body: body(context, registerBloc),
        bottomNavigationBar: bottonRegister(registerBloc),
      ),
    );
  }

  Padding bottonRegister(RegisterBloc registerBloc) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ButtomWidget(
        heroTag: 'btn1',
        stream: registerBloc.validateBasicForm,
        //stream: null,
        function: () => {
          if (registerBloc.password == registerBloc.confirmPassword)
            {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text('Usuario Creado'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/');
                                registerLogic.cleanRegisterBolc(registerBloc);
                              },
                              child: const Text('Aceptar'),
                            )),
                      ],
                    );
                  }),
            }
          else
            {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text('Las Contraseñas no coinciden '),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Aceptar')),
                      ],
                    );
                  })
            }
        },
        text: S.of(context).continue_label,
        enebleColor: const Color.fromRGBO(83, 232, 139, 1),
        disableColor: Colors.grey[400]!,
      ),
    );
  }

  Stack body(BuildContext context, RegisterBloc registerBloc) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/img/logo.png',
                  height: 150,
                ),
              ),
              Text(
                S.of(context).register_title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  color: Color.fromRGBO(9, 5, 28, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return form(registerBloc);
                  })
            ],
          ),
        )
      ],
    );
  }

  Column form(RegisterBloc registerBloc) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              //hintText: "Your Name",
              labelText: 'nombre de usuario',
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
              registerBloc.changeUserName(value),
            },
            obscureText: false,
            //maxLength: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              //hintText: "Your Name",
              labelText: S.of(context).name,
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
              registerBloc.changeName(value),
            },
            obscureText: false,
            //maxLength: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: StreamBuilder<Object>(
              stream: registerBloc.emailStream,
              builder: (context, AsyncSnapshot snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    //hintText: "Your Name",
                    labelText: snapshot.hasError && snapshot.error != 'Empty'
                        ? snapshot.error.toString()
                        : "Correo",
                    labelStyle: snapshot.hasError && snapshot.error != 'Empty'
                        ? const TextStyle(fontSize: 18, color: Colors.red)
                        : const TextStyle(fontSize: 14, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                        //color: snapshot.hasError ? Colors.red : Colors.white,
                      ),
                    ),
                    disabledBorder: InputBorder.none,

                    //fillColor: Color.fromRGBO(240, 240, 240, 1),
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    //errorText: snapshot.hasError ? 'asd' : null,

                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) => {
                    registerBloc.changeEmail(value),
                  },
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  //maxLength: 20,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: StreamBuilder<Object>(
              stream: registerBloc.passwordStream,
              builder: (context, snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    //hintText: "Your Name",
                    labelText: snapshot.hasError && snapshot.error != 'Empty'
                        ? S.of(context).invalid_password
                        : "Contraseña",
                    labelStyle: snapshot.hasError && snapshot.error != 'Empty'
                        ? const TextStyle(fontSize: 18, color: Colors.red)
                        : const TextStyle(fontSize: 14, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    //disabledBorder: InputBorder.none,
                    //fillColor: Colors.black12,
                    contentPadding: EdgeInsets.all(16),
                    filled: true,

                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.grey,
                    ),

                    //icon: Icon(Icons.person),
                  ),
                  onChanged: (value) => {
                    registerBloc.changePassword(value),
                  },
                  obscureText: true,
                  //maxLength: 20,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: StreamBuilder<Object>(
              stream: registerBloc.confirmPasswordStream,
              builder: (context, snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    //hintText: "Your Name",
                    labelText: snapshot.hasError && snapshot.error != 'Empty'
                        ? S.of(context).invalid_password
                        : "Confirmar Contraseña",
                    labelStyle: snapshot.hasError && snapshot.error != 'Empty'
                        ? const TextStyle(fontSize: 18, color: Colors.red)
                        : const TextStyle(fontSize: 14, color: Colors.black),
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
                      Icons.password,
                      color: Colors.grey,
                    ),

                    //icon: Icon(Icons.person),
                  ),
                  onChanged: (value) => {
                    registerBloc.changeConfirmPassword(value),
                  },
                  obscureText: true,
                  //maxLength: 20,
                );
              }),
        ),
      ],
    );
  }
}
