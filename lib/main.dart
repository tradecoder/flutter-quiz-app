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

  void _restart() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _collectScoreAndMoveNext(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Quiz App'),
        ),

        // continue to show Quiz until question not ends
        // when there will be now question left, leave Quiz and show Result
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: _questionIndex < DataSet.questions.length
              ? Quiz(
                  questions: DataSet.questions,
                  questionIndex: _questionIndex,
                  actionOnAnswerAndCollectScore: _collectScoreAndMoveNext,
                )
              : Result(score: _totalScore, action: _restart),
        ),
      ),
    );
  }
}
