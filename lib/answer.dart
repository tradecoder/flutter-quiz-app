import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback actionOnSelectAnswer;
  final String answerOptions;

  const Answer({
    required this.answerOptions,
    required this.actionOnSelectAnswer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0, right: 3.0),
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            padding: const EdgeInsets.all(14.0),
          ),
          onPressed: actionOnSelectAnswer,
          child: Text(
            answerOptions,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
