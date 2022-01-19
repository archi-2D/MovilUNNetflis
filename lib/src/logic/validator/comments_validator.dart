import 'dart:async';

class CommentsValidator{
  final validateEmpty = StreamTransformer<String, String>.fromHandlers(handleData: (string, sink) {
    if (string == '') {
      sink.addError('Empty');
    } else {
      sink.add(string);
    }
  });
}