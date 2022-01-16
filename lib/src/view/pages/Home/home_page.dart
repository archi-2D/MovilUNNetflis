import 'package:flutter/material.dart';
import 'package:mobile_component/src/view/widgets/shared/view/botton_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          color: Colors.blue,
        ),
      ],
    );
  }
}
