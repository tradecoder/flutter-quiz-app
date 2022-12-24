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
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      color: null,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(14.0),
        ),
        onPressed: actionOnSelectAnswer,
        child: Text(answerOptions),
      ),
    );
  }
}
