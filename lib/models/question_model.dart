class Question {
  final String questionText;
  final Map<String, String> answers;
  final Map<String, int> score;
  Question(
      {required this.questionText, required this.answers, required this.score});
}
