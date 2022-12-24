import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback action;

  const Result({
    required this.score,
    required this.action,
    super.key,
  });

  String get resultStatus {
    String status;
    if (score <= 15) {
      status = 'Not so good! Your score is $score. Try again!';
    } else if (score <= 20) {
      status = 'Awesome! Your score is $score';
    } else if (score > 20) {
      status = 'Superb! Your score is $score';
    } else {
      status = 'Your score is $score. Try again?';
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultStatus,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(height: 30.0),
          OutlinedButton(
            onPressed: action,
            child: const Text('Retake Quiz!'),
          ),
        ],
      ),
    );
  }
}
