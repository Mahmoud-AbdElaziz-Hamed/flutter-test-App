import 'package:flutter/material.dart';
import 'package:flutter_new_app/models/question_model.dart';

class Answers extends StatelessWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function(String) handleClick;
  const Answers({
    Key? key,
    required this.questions,
    required this.questionIndex,
    required this.handleClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...(questions[questionIndex].answers).map(
        (answer) => Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () => handleClick(answer.textAnswer),
            style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50))),
            child: Text(
              answer.textAnswer,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.02),
            ),
          ),
        ),
      )
    ]);
  }
}
