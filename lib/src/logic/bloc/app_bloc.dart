import 'package:rxdart/rxdart.dart';

class AppBloc {
  final _pageControler = BehaviorSubject<int>();

  Stream<int> get pageStream => _pageControler.stream;

  Function(int) get changePage => _pageControler.sink.add;

  int? get page => _pageControler.valueOrNull;

  dispose() {
    _pageControler.close();
  }
}
