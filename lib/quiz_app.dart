import 'package:flutter/material.dart';
import 'package:flutter_new_app/components/after_finish_quiz.dart';
import 'package:flutter_new_app/components/answers.dart';
import 'package:flutter_new_app/models/question_model.dart';
import 'package:flutter_new_app/components/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);
  @override
  State<QuizApp> createState() => _MyAppState();
}

enum Color {
  white(text: "white", score: 10),
  black(text: "black", score: 1),
  red(text: "red", score: 8);

  final String text;
  final int score;

  const Color({required this.text, required this.score});
}

enum Sports {
  running(text: "running", score: 10),
  swimming(text: "swimming", score: 8),
  boxing(text: "boxing", score: 5);

  final String text;
  final int score;

  const Sports({required this.text, required this.score});
}

enum Weather {
  summer(text: "summer", score: 1),
  winter(text: "winter", score: 10),
  spring(text: "spring", score: 5);

  final String text;
  final int score;

  const Weather({required this.text, required this.score});
}

class _MyAppState extends State<QuizApp> {
  var questionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question(
      questionText: "What is your favorite colour?",
      answers: [
        Color.white.text,
        Color.black.text,
        Color.red.text,
      ],
      score: [
        Color.white.score,
        Color.black.score,
        Color.red.score,
      ],
    ),
    Question(
      questionText: "What is your favorite sport?",
      answers: [
        Sports.running.text,
        Sports.swimming.text,
        Sports.boxing.text,
      ],
      score: [
        Sports.running.score,
        Sports.swimming.score,
        Sports.boxing.score,
      ],
    ),
    Question(
      questionText: "What is your favorite weather?",
      answers: [
        Weather.summer.text,
        Weather.winter.text,
        Weather.spring.text,
      ],
      score: [
        Weather.summer.score,
        Weather.winter.score,
        Weather.spring.score,
      ],
    )
  ];

  void handleAnswerClick(int index) {
    setState(() {
      if (questionIndex < questions.length) {
        score += questions[questionIndex].score[index];
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
