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
    return Container(
      color: null,
      padding: const EdgeInsets.only(top: 20.0),
      height: 400,
      child: Center(
        child: Card(
          elevation: 6,
          shape: const CircleBorder(),
          child: Container(
            color: null,
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultStatus,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(height: 30.0),
                Container(
                  color: null,
                  height: 45,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: action,
                    child: const Text('Retake Quiz!'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
