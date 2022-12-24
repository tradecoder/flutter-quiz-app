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
      height: 400.00,
      child: Center(
        child: Card(
          elevation: 5,
          child: Container(
            color: null,
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    resultStatus,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(height: 30.0),
                Card(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(12.0),
                      elevation: 3,
                      backgroundColor: const Color.fromARGB(124, 97, 241, 229),
                    ),
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
