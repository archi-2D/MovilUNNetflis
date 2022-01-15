import 'package:mobile_component/src/logic/validator/forgot_pass_validator.dart';
import 'package:rxdart/rxdart.dart';

class ForgotPassBloc with ForgotPassValidator {
  final _emailControler = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailControler.stream.transform(validateEmail);

  Stream<bool> get validateBasicForm =>
      Rx.combineLatest2(emailStream, emailStream, (a, b) => true);

  Function(String) get changeEmail => _emailControler.sink.add;

  String? get email => _emailControler.valueOrNull;

  dispose() {
    _emailControler.close();
  }
}
