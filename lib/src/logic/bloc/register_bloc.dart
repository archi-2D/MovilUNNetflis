import 'package:mobile_component/src/logic/validator/register_validator.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with RegisterValidator {
  final _nameControler = BehaviorSubject<String>();
  final _userNameControler = BehaviorSubject<String>();
  final _emailControler = BehaviorSubject<String>();
  final _phoneNumberControler = BehaviorSubject<String>();
  final _passwordControler = BehaviorSubject<String>();
  final _confirmPasswordControler = BehaviorSubject<String>();

  Stream<String> get nameStream =>
      _nameControler.stream.transform(validateEmpty);
  Stream<String> get userNameStream =>
      _userNameControler.stream.transform(validateEmpty);
  Stream<String> get emailStream =>
      _emailControler.stream.transform(validateEmpty);
  Stream<String> get phoneNumberStream =>
      _phoneNumberControler.stream.transform(validateEmpty);
  Stream<String> get passwordStream =>
      _passwordControler.stream.transform(validatePassword);
  Stream<String> get confirmPasswordStream =>
      _confirmPasswordControler.stream.transform(validatePassword);

  Stream<bool> get validateBasicForm => Rx.combineLatest5(
      nameStream,
      userNameStream,
      emailStream,
      passwordStream,
      confirmPasswordStream,
      (
        a,
        b,
        c,
        d,
        e,
      ) =>
          true);

  Function(String) get changeName => _nameControler.sink.add;
  Function(String) get changeUserName => _userNameControler.sink.add;
  Function(String) get changeEmail => _emailControler.sink.add;
  Function(String) get changePhoneNumber => _phoneNumberControler.sink.add;
  Function(String) get changePassword => _passwordControler.sink.add;
  Function(String) get changeConfirmPassword =>
      _confirmPasswordControler.sink.add;

  String? get name => _nameControler.valueOrNull;
  String? get userName => _userNameControler.valueOrNull;
  String? get email => _emailControler.valueOrNull;
  String? get phoneNumber => _phoneNumberControler.valueOrNull;
  String? get password => _passwordControler.valueOrNull;
  String? get confirmPassword => _confirmPasswordControler.valueOrNull;

  dispose() {
    _nameControler.close();
    _userNameControler.close();
    _emailControler.close();
    _phoneNumberControler.close();
    _passwordControler.close();
    _confirmPasswordControler.close();
  }
}
