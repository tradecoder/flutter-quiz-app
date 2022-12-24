import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question({required this.questionText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 20, color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );
  }
}
