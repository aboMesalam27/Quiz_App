import 'package:flutter/material.dart';
import 'answer.dart';
import 'questions.dart';

class Quiz extends StatelessWidget {
  final questions;
  final QuestionIndex;
  final answerQuestion;

  Quiz(this.questions, this.QuestionIndex, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Question(questions[QuestionIndex]['QuestionText']),
          ...(questions[QuestionIndex]['Answer'] as List<Map<String, Object>>)
              .map((varanswer) {
            return Answer(
                () => answerQuestion(varanswer['score']), varanswer['text']);
          }).toList(),
        ],
      ),
    );
  }
}
