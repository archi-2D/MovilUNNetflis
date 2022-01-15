import 'dart:async';

class LoginValidator {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email == null) {
      sink.addError('');
    } else {
      RegExp regExp = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$");
      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Correo no valido');
      }
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password == null) {
      sink.addError('');
    } else {
      RegExp regExp = new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
      if (regExp.hasMatch(password)) {
        sink.add(password);
      } else {
        sink.addError('Contraseña no valida (Minimum eight characters, at least one letter and one number)');
      }
    }
  });
}
