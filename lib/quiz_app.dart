import 'package:flutter/material.dart';
import 'package:flutter_new_app/models/answer_model.dart';
import 'package:flutter_new_app/models/score_model.dart';
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
      answers: [
        Answer(id: 1, textAnswer: "white"),
        Answer(id: 2, textAnswer: "black"),
        Answer(id: 3, textAnswer: "red"),
      ],
      score: [
        Score(answer: "white", score: 5),
        Score(answer: "black", score: 1),
        Score(answer: "red", score: 3),
      ],
    ),
    Question(
      questionText: "What is your favorite sport?",
      answers: [
        Answer(id: 1, textAnswer: "running"),
        Answer(id: 2, textAnswer: "swimming"),
        Answer(id: 3, textAnswer: "boxing"),
      ],
      score: [
        Score(answer: "running", score: 5),
        Score(answer: "swimming", score: 7),
        Score(answer: "boxing", score: 3),
      ],
    ),
    Question(
      questionText: "What is your favorite weather?",
      answers: [
        Answer(id: 1, textAnswer: "summer"),
        Answer(id: 2, textAnswer: "winter"),
        Answer(id: 3, textAnswer: "spring"),
      ],
      score: [
        Score(answer: "summer", score: 5),
        Score(answer: "winter", score: 7),
        Score(answer: "spring", score: 3),
      ],
    )
  ];

  void handleAnswerClick(String answer) {
    setState(() {
      if (questionIndex < questions.length) {
        score += questions[questionIndex].score[questionIndex].score;
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
