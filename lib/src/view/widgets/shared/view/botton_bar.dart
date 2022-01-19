import 'package:flutter/material.dart';
import 'package:mobile_component/src/logic/bloc/app_bloc.dart';
import 'package:mobile_component/src/logic/provider/provider_blocs.dart';
import 'package:provider/src/provider.dart';

class BottonBar extends StatefulWidget {
  const BottonBar({Key? key}) : super(key: key);

  @override
  _BottonBarState createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBar> {
  late AppBloc appBloc;

  @override
  Widget build(BuildContext context) {
    appBloc = context.read<ProviderBlocs>().appBloc;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.red), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.comment, color: Colors.red,), label: '')
      ],
      currentIndex: appBloc.page!,
      backgroundColor: Colors.black38,
      onTap: onTapped,
    );
  }

  void onTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, 'home');
    }
    if (index == 1) {
      Navigator.pushReplacementNamed(context, 'comments');
    }
    setState(() {
      appBloc.changePage(index);
    });
  }
}
