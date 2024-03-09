import 'package:flutter_new_app/models/answer_model.dart';
import 'package:flutter_new_app/models/score_model.dart';

class Question {
  final String questionText;
  final List<Answer> answers;
  final List<Score> score;
  Question(
      {required this.questionText, required this.answers, required this.score});
}
