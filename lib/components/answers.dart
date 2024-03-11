import 'package:flutter/material.dart';
import 'package:flutter_new_app/models/question_model.dart';

class Answers extends StatelessWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function(int) handleClick;
  const Answers({
    Key? key,
    required this.questions,
    required this.questionIndex,
    required this.handleClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...(questions[questionIndex].answers).asMap().entries.map(
              (entry) => Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => handleClick(entry.key),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50))),
                  child: Text(
                    entry.value,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.02),
                  ),
                ),
              ),
            )
      ],
    );
  }
}
