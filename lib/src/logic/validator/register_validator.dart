import 'dart:async';

class RegisterValidator {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email == '') {
      sink.addError('Empty');
    } else {
      RegExp regExp = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");
      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Correo no valido');
      }
    }
  });
  final validateEmpty = StreamTransformer<String, String>.fromHandlers(handleData: (string, sink) {
    if (string == '') {
      sink.addError('Empty');
    } else {
      sink.add(string);
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password == '') {
      sink.addError('Empty');
    } else {
      RegExp regExp = new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
      if (regExp.hasMatch(password)) {
        sink.add(password);
      } else {
        sink.addError('not_valid_password');
      }
    }
  });
}
