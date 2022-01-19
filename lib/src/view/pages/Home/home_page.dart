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
          title: Text('UNetflix'),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved,
              tooltip: 'Saved Suggestions',
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.redAccent,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _imageLogo("Encanto"),
                _imageLogo("The witcher"),
                _imageLogo("Mr nobody"),
                _imageLogo("Mr robot"),
                Container(
                  color: Colors.black87,
                  child: ListTile(
                    leading: Text('There are no more results', style: TextStyle(fontSize: 16, color: Colors.white)),
                    trailing: Text('Thank you for watching', style: TextStyle(fontSize: 12, color: Colors.white))
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottonBar(),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Menu Options'),
              centerTitle: true,
              backgroundColor: Colors.red,
            ),
            backgroundColor: Colors.deepPurple,
            body: Container(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child: ListTile(
                      leading: Text('Option button'),
                      trailing: Text('No. 1')
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text('Option button'),
                      trailing: Text('No. 2')
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }

  Container _imageLogo(String name) {
    var location = 'assets/img/' + noWhiteSpaces(name) +'.jpg';
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: ListTile(
              leading: Text(name, style: TextStyle(fontSize: 18, color: Colors.white)),
              trailing: Text('UNetflix Original', style: TextStyle(fontSize: 18, color: Colors.white))
            ),
          ),
          Container(
            color: Colors.black,
            child: Center(
              child: Image.asset(
                location,
                height: 250,
              ),
            ),
          ),
        ],
      )
    );
  }

  String noWhiteSpaces(String word){
    String newS = '';
    for(int i=0;i<word.length;i++){
      if(!word[i].contains(' ')){
        newS = newS + word[i];
      }
    }
    return newS;
  }
}