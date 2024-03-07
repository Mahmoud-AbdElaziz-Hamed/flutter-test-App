import 'package:flutter/material.dart';

class AfterFinsishQuiz extends StatelessWidget {
  final Function() handleClick;
  final int score;
  const AfterFinsishQuiz(
      {super.key, required this.handleClick, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Congratulations, you're done, your score is : $score",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
          ),
          TextButton(
              onPressed: handleClick,
              child: const Text(
                "return to quiz",
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
