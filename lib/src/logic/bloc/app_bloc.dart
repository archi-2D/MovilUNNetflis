import 'package:rxdart/rxdart.dart';

class AppBloc {
  final _pageControler = BehaviorSubject<int>();
  final _tokenControler = BehaviorSubject<String>();
  final _usernameControler = BehaviorSubject<String>();

  Stream<int> get pageStream => _pageControler.stream;
  Stream<String> get tokenStream => _tokenControler.stream;
  Stream<String> get usernameStream => _usernameControler.stream;

  Function(int) get changePage => _pageControler.sink.add;
  Function(String) get changeToken => _tokenControler.sink.add;
  Function(String) get changeUsername => _usernameControler.sink.add;

  int? get page => _pageControler.valueOrNull;
  String? get token => _tokenControler.valueOrNull;
  String? get username => _usernameControler.valueOrNull;

  dispose() {
    _pageControler.close();
    _tokenControler.close();
    _usernameControler.close();
  }
}
