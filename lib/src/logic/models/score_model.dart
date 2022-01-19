import 'dart:convert';

class Score {
  final String username;
  final String moiveSerieName;
  final int score;
  final String description;

  Score(this.username, this.moiveSerieName, this.score, this.description);

  Score.fromJson(Map<dynamic, dynamic> json)
      : username = json['user_name'],
        moiveSerieName = json['moive_serie_name'],
        score = json['score'],
        description = json['description'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'user_name': username,
        'moive_serie_name': moiveSerieName,
        'score': score,
        'description': description,
      };
}
