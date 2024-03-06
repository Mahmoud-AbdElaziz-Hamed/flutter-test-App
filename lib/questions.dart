import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
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
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        questions[questionIndex]["questionText"],
        style: const TextStyle(fontSize: 32),
      ),
    );
  }
}
