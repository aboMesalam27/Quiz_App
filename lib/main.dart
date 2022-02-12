import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import 'questions.dart';
import 'answer.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitch = false;
  Color w = Colors.white;
  Color b = Colors.black54;

  var _totalScore = 0;
  int _QuestionIndex = 0;
  int num0 = 0;
  int num1 = 0;
  int num2 = 0;

  void _restQuiz() {
    setState(() {
      _QuestionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void answerQuestion(score) {
    setState(() {
      if (_QuestionIndex == 0) num0 = score;
      if (_QuestionIndex == 1) num1 = score;
      if (_QuestionIndex == 2) num2 = score;

      _totalScore += score;
      _QuestionIndex += 1;
    });
    print("answer chosen ");
    print(_QuestionIndex);
    print(_totalScore);
  }

  final List<Map<String, Object>> _questions = [
    {
      'QuestionText': 'what\'s your favourite color?',
      'Answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Black', 'score': 40},
      ]
    },
    {
      'QuestionText': 'what\'s your favourite animal?',
      'Answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Elephant', 'score': 20},
        {'text': 'Lion', 'score': 30},
        {'text': 'Tiger', 'score': 40}
      ]
    },
    {
      'QuestionText': 'what\'s your favourite subject?',
      'Answer': [
        {'text': 'Computer network', 'score': 10},
        {'text': 'Algorithm', 'score': 20},
        {'text': 'Maths', 'score': 30},
        {'text': 'Pythons', 'score': 40}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
          ],
          title: Text("Quiz App"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Container(
          color: w,
          child: _QuestionIndex < _questions.length
              ? Quiz(_questions, _QuestionIndex, answerQuestion)
              : Result(_restQuiz, _totalScore, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              if (_QuestionIndex == 1) _totalScore -= num0;
              if (_QuestionIndex == 2) _totalScore -= num1;
              if (_QuestionIndex == 3) _totalScore -= num2;

              if (_QuestionIndex > 0) {
                _QuestionIndex--;
              }
            });
          },
        ),
      ),
    );
  }
}
