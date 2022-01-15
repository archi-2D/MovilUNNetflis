import 'package:mobile_component/src/logic/validator/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidator {
  final _userNameControler = BehaviorSubject<String>();
  final _phoneNumberControler = BehaviorSubject<String>();
  final _passwordControler = BehaviorSubject<String>();
  final _userState = BehaviorSubject<String>();

  Stream<String> get userNameStream =>
      _userNameControler.stream.transform(validateEmail);
  Stream<String> get phoneNumberStream => _phoneNumberControler.stream;
  Stream<String> get passwordStream =>
      _passwordControler.stream.transform(validatePassword);
  Stream<String> get userStateStream => _userState.stream;
  Stream<bool> get validateBasicForm =>
      Rx.combineLatest2(_userNameControler, passwordStream, (a, b) => true);

  Function(String) get changeuserName => _userNameControler.sink.add;
  Function(String) get changePhoneNumber => _phoneNumberControler.sink.add;
  Function(String) get changePassword => _passwordControler.sink.add;
  Function(String) get changeUserState => _userState.sink.add;

  String? get userName => _userNameControler.valueOrNull;
  String? get password => _passwordControler.valueOrNull;
  String? get userState => _userState.valueOrNull;

  dispose() {
    _userNameControler.close();
    _phoneNumberControler.close();
    _passwordControler.close();
  }
}
