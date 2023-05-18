import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionIndex;
  final Function actionOnAnswerAndCollectScore;

  const Quiz({
    required this.questions,
    required this.questionIndex,
    required this.actionOnAnswerAndCollectScore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: Text('${questionIndex + 1}/${questions.length}'),
        ),
        const SizedBox(height: 10),
        Question(questionText: questions[questionIndex]['questionText']),
        const SizedBox(
          height: 20.0,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Answer(
            answerOptions: answer['text'],
            // send the score - answer['score'] to collect score and move to next index
            actionOnSelectAnswer: () =>
                actionOnAnswerAndCollectScore(answer['score']),
          );
        }).toList(),
      ],
    );
  }
}
