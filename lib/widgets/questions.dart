import 'package:flutter/material.dart';
import 'package:flutter_new_app/models/question_model.dart';

class Questions extends StatelessWidget {
  final List<Question> questions;
  final int questionIndex;
  const Questions({
    Key? key,
    required this.questions,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        questions[questionIndex].questionText,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
      ),
    );
  }
}
