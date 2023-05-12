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
    if (score <= 50) {
      status = 'Try again!';
    } else if (score <= 70) {
      status = 'Awesome!';
    } else if (score > 80) {
      status = 'Superb!';
    } else {
      status = '';
    }
    return status;
  }

  String get showScore {
    return 'Your score is $score';
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
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: score <= 50 ? Colors.red : Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  showScore,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(score <= 50 ? 'You need more development' : ''),
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
