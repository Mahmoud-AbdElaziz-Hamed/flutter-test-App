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
  answer1(textAnswer: "white", score: 10),
  answer2(textAnswer: "black", score: 1),
  answer3(textAnswer: "red", score: 8);

  final String textAnswer;
  final int score;

  const Color({required this.textAnswer, required this.score});
}

enum Sports {
  answer1(textAnswer: "running", score: 10),
  answer2(textAnswer: "swimming", score: 8),
  answer3(textAnswer: " boxing", score: 5);

  final String textAnswer;
  final int score;

  const Sports({required this.textAnswer, required this.score});
}

enum Weather {
  answer1(textAnswer: " summer", score: 1),
  answer2(textAnswer: " winter", score: 10),
  answer3(textAnswer: " spring", score: 5);

  final String textAnswer;
  final int score;

  const Weather({required this.textAnswer, required this.score});
}

class _MyAppState extends State<QuizApp> {
  var questionIndex = 0;
  int score = 0;

  final List<Question> questions = [
    Question(
      questionText: "What is your favorite colour?",
      answers: [
        Color.answer1.textAnswer,
        Color.answer2.textAnswer,
        Color.answer3.textAnswer,
      ],
      score: [
        Color.answer1.score,
        Color.answer2.score,
        Color.answer3.score,
      ],
    ),
    Question(
      questionText: "What is your favorite sport?",
      answers: [
        Sports.answer1.textAnswer,
        Sports.answer2.textAnswer,
        Sports.answer3.textAnswer,
      ],
      score: [
        Sports.answer1.score,
        Sports.answer2.score,
        Sports.answer3.score,
      ],
    ),
    Question(
      questionText: "What is your favorite weather?",
      answers: [
        Weather.answer1.textAnswer,
        Weather.answer2.textAnswer,
        Weather.answer3.textAnswer,
      ],
      score: [
        Weather.answer1.score,
        Weather.answer2.score,
        Weather.answer3.score,
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
