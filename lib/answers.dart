import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
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
      ...(questions[questionIndex]["answers"] as Map<String, String>)
          .entries
          .map(
            (e) => Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => handleClick(e.value),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50))),
                child: Text(e.value),
              ),
            ),
          )
    ]);
  }
}
