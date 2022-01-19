import 'package:mobile_component/src/logic/validator/comments_validator.dart';
import 'package:rxdart/rxdart.dart';

class CommentsBloc with CommentsValidator {
  final _nameControler = BehaviorSubject<String>();
  final _userNameControler = BehaviorSubject<String>();
  final _scoreControler = BehaviorSubject<String>();
  final _descriptionControler = BehaviorSubject<String>();

  Stream<String> get nameStream =>
      _nameControler.stream.transform(validateEmpty);
  Stream<String> get userNameStream =>
      _userNameControler.stream.transform(validateEmpty);
  Stream<String> get scoreStream =>
      _scoreControler.stream.transform(validateEmpty);
  Stream<String> get descriptionStream =>
      _descriptionControler.stream.transform(validateEmpty);

  Stream<bool> get validateBasicForm => Rx.combineLatest4(
      nameStream,
      userNameStream,
      scoreStream,
      descriptionStream,
      ( a, b, c, d, ) => true);

  Function(String) get changeName => _nameControler.sink.add;
  Function(String) get changeUserName => _userNameControler.sink.add;
  Function(String) get changeScore => _scoreControler.sink.add;
  Function(String) get changeDescription => _descriptionControler.sink.add;

  String? get name => _nameControler.valueOrNull;
  String? get userName => _userNameControler.valueOrNull;
  String? get score => _scoreControler.valueOrNull;
  String? get description => _descriptionControler.valueOrNull;

  dispose() {
    _nameControler.close();
    _userNameControler.close();
    _scoreControler.close();
    _descriptionControler.close();
  }
}