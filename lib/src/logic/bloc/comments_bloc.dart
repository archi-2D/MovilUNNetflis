import 'package:mobile_component/src/logic/models/score_model.dart';
import 'package:mobile_component/src/logic/validator/comments_validator.dart';
import 'package:rxdart/rxdart.dart';

class CommentsBloc with CommentsValidator {
  final _nameControler = BehaviorSubject<String>();
  final _userNameControler = BehaviorSubject<String>();
  final _scoreControler = BehaviorSubject<String>();
  final _descriptionControler = BehaviorSubject<String>();
  final _moviesScoresControler = BehaviorSubject<List<Score>>();
  final _seriesScoresControler = BehaviorSubject<List<Score>>();
  final _movieSerieSelectedControler = BehaviorSubject<String>();
  final _isMovieControler = BehaviorSubject<bool>();

  Stream<String> get nameStream =>
      _nameControler.stream.transform(validateEmpty);
  Stream<String> get userNameStream =>
      _userNameControler.stream.transform(validateEmpty);
  Stream<String> get scoreStream =>
      _scoreControler.stream.transform(validateEmpty);
  Stream<String> get descriptionStream =>
      _descriptionControler.stream.transform(validateEmpty);
  Stream<List<Score>> get moviesScoresStream => _moviesScoresControler.stream;
  Stream<List<Score>> get seriesScoresStream => _seriesScoresControler.stream;
  Stream<String> get movieSerieSelectedStream =>
      _movieSerieSelectedControler.stream;
  Stream<bool> get isMovieStream => _isMovieControler.stream;

  Stream<bool> get validateBasicForm => Rx.combineLatest4(
      nameStream,
      userNameStream,
      scoreStream,
      descriptionStream,
      (
        a,
        b,
        c,
        d,
      ) =>
          true);

  Function(String) get changeName => _nameControler.sink.add;
  Function(String) get changeUserName => _userNameControler.sink.add;
  Function(String) get changeScore => _scoreControler.sink.add;
  Function(String) get changeDescription => _descriptionControler.sink.add;
  Function(List<Score>) get changeMovieScores =>
      _moviesScoresControler.sink.add;
  Function(List<Score>) get changeSeriesScores =>
      _seriesScoresControler.sink.add;
  Function(String) get changeMovieSerieSelected =>
      _movieSerieSelectedControler.sink.add;
  Function(bool) get changeIsMovie => _isMovieControler.sink.add;

  String? get name => _nameControler.valueOrNull;
  String? get userName => _userNameControler.valueOrNull;
  String? get score => _scoreControler.valueOrNull;
  String? get description => _descriptionControler.valueOrNull;
  List<Score>? get moviesScore => _moviesScoresControler.valueOrNull;
  List<Score>? get seriesScore => _seriesScoresControler.valueOrNull;
  String? get movieSerieSelected => _movieSerieSelectedControler.valueOrNull;
  bool? get isMovie => _isMovieControler.valueOrNull;

  dispose() {
    _nameControler.close();
    _userNameControler.close();
    _scoreControler.close();
    _descriptionControler.close();
    _moviesScoresControler.close();
    _movieSerieSelectedControler.close();
    _seriesScoresControler.close();
    _isMovieControler.close();
  }
}
