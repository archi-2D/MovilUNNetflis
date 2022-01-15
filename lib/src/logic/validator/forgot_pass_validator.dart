import 'dart:async';

class ForgotPassValidator {
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
}
