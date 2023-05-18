import 'dart:async';

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
import './dataset.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  int _answerScore = 0;
  bool _isLoading = false;

  void _restart() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _collectScoreAndMoveNext(int score) {
    setState(() {
      _answerScore = score;
      _isLoading = true;
    });
    Timer(const Duration(seconds: 1), () {
      _totalScore += score;

      setState(() {
        _questionIndex = _questionIndex + 1;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Quiz App'),
        ),

        // continue to show Quiz until question not ends
        // when there will be now question left, leave Quiz and show Result
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: _questionIndex < DataSet.questions.length
                  ? Quiz(
                      questions: DataSet.questions,
                      questionIndex: _questionIndex,
                      actionOnAnswerAndCollectScore: _collectScoreAndMoveNext,
                    )
                  : Result(score: _totalScore, action: _restart),
            ),
            _isLoading
                ? Container(
                    color: Colors.white70,
                    height: double.infinity,
                    child: Center(
                        child: _answerScore > 0
                            ? const Icon(
                                Icons.check_circle,
                                size: 80,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.close_rounded,
                                size: 80,
                                color: Colors.red,
                              )))
                : Container(),
          ],
        ),
      ),
    );
  }
}
