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
      child: Container(
        padding: const EdgeInsets.only(bottom: 3.0, right: 3.0),
        width: 300,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            elevation: 3,
            padding: const EdgeInsets.all(14.0),
            backgroundColor: const Color.fromARGB(124, 97, 241, 229),
          ),
          onPressed: actionOnSelectAnswer,
          child: Text(answerOptions),
        ),
      ),
    );
  }
}
