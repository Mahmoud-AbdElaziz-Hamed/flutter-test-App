import 'package:flutter/material.dart';
import 'package:flutter_new_app/widgets/after_finish_quiz.dart';
import 'package:flutter_new_app/widgets/answers.dart';
import 'package:flutter_new_app/models/question_model.dart';
import 'package:flutter_new_app/widgets/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);
  @override
  State<QuizApp> createState() => _MyAppState();
}

class _MyAppState extends State<QuizApp> {
  var questionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question(
        questionText: "What is your favorite colour?",
        answers: {"1": "white", "2": "black", "3": "red"},
        score: {"white": 5, "black": 1, "red": 3}),
    Question(
        questionText: "What is your favorite sport?",
        answers: {"1": "running", "2": "swimming", "3": "boxing"},
        score: {"running": 5, "swimming": 5, "boxing": 3}),
    Question(
        questionText: "What is your favorite weather?",
        answers: {"1": "summer", "2": "winter", "3": "spring"},
        score: {"summer": 1, "winter": 5, "spring": 3})
  ];

  void handleAnswerClick(String answer) {
    setState(() {
      if (questionIndex < questions.length) {
        score += questions[questionIndex].score[answer]!;
        questionIndex += 1;
      }
    });
  }

  void handleReturnClick() {
    setState(() {
      setState(() {
        questionIndex = 0;
        score = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My test app'),
        ),
        body: questionIndex == questions.length
            ? AfterFinsishQuiz(
                handleClick: handleReturnClick,
                score: score,
              )
            : Column(children: [
                Questions(
                  questions: questions,
                  questionIndex: questionIndex,
                ),
                Answers(
                  questions: questions,
                  questionIndex: questionIndex,
                  handleClick: handleAnswerClick,
                )
              ]),
      ),
    );
  }
}
