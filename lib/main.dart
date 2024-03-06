import 'package:flutter/material.dart';
import 'package:flutter_new_app/answers.dart';
import 'package:flutter_new_app/questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  num score = 0;
  final List<Map<String, dynamic>> questions = [
    {
      "questionText": "What is your favorite colour?",
      "answers": {"1": "white", "2": "black", "3": "red"},
      "score": {"white": 5, "black": 1, "red": 3}
    },
    {
      "questionText": "What is your favorite sport?",
      "answers": {"1": "running", "2": "swimming", "3": "boxing"},
      "score": {"running": 5, "swimming": 5, "red": 3}
    },
    {
      "questionText": "What is your favorite weather?",
      "answers": {"1": "summer", "2": "winter", "3": "spring"},
      "score": {"summer": 1, "winter": 5, "spring": 3}
    }
  ];

  void handleClick(String answer) {
    setState(() {
      if (questionIndex < questions.length) {
        score += questions[questionIndex]["score"][answer];
        questionIndex += 1;
      }
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
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Congratulations, you're done, your score is : $score",
                      style: const TextStyle(fontSize: 28),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            questionIndex = 0;
                            score = 0;
                          });
                        },
                        child: const Text(
                          "return to quiz",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              )
            : Column(children: [
                Questions(
                  questions: questions,
                  questionIndex: questionIndex,
                ),
                Answers(
                    questions: questions,
                    questionIndex: questionIndex,
                    handleClick: handleClick)
              ]),
      ),
    );
  }
}
