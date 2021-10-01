// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void answerQuestion(int score) {
    totalScore += score;

    setState(() {
      questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 3},
          {'text': 'Snake', 'score': 11},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 9},
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'text': 'Max', 'score': 1},
          {'text': 'Max', 'score': 1},
          {'text': 'Max', 'score': 1},
          {'text': 'Max', 'score': 1},
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                questions: questions,
                questionIndex: questionIndex,
                answerQuestion: answerQuestion)
            : Result(resultScore: totalScore),
      ),
    );
  }
}
