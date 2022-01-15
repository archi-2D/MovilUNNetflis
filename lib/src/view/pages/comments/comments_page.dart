import 'package:flutter/material.dart';
import 'package:mobile_component/src/view/widgets/shared/view/botton_bar.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
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
          color: Colors.red,
        )
      ],
    );
  }
}
