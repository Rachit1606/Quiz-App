import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'A is B\'s sister. C is B\'s mother. D is C\'s father. E is D\'s mother. Then, how is A related to D?',
      'answers': [
        {'text': 'Granddaughter', 'score': 1},
        {'text': 'GrandFather', 'score': 0},
        {'text': 'Grandmother', 'score': 0},
        {'text': 'Daughter', 'score': 0},
      ],
    },
    {
      'questionText':
          'How many pairs of letters are there in the word " CASTRAPHONE" which have as many letters between them in the word as in the alphabet?',
      'answers': [
        {'text': '3', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '5', 'score': 0},
        {'text': '6', 'score': 1},
      ],
    },
    {
      'questionText':
          'In a certain code language COMPUTER is written as RFUVQNPC. How will MEDICINE be written in that code language?',
      'answers': [
        {'text': ' MFEDJJOE', 'score': 0},
        {'text': 'EOJDEJFM', 'score': 0},
        {'text': 'MFEJDJOE', 'score': 0},
        {'text': 'EOJDJEFM', 'score': 1},
      ],
    },
    {
      'questionText':
          'If South-East becomes North, North-East becomes West and so on. What will West become?',
      'answers': [
        {'text': 'North-East', 'score': 0},
        {'text': 'North-West', 'score': 0},
        {'text': 'South-East', 'score': 1},
        {'text': 'South-West', 'score': 0},
      ],
    },
    {
      'questionText':
          'A girl introduced a boy as the son of the daughter of the father of her uncle. The boy is girl\'s',
      'answers': [
        {'text': 'Brother', 'score': 1},
        {'text': 'Uncle', 'score': 0},
        {'text': 'Son', 'score': 0},
        {'text': 'Son-in-Law', 'score': 0},
      ],
    },
    {
      'questionText':
          'How many such pairs of digits are there in the number 421579368 each of which has as many digits between them in the number as when they are arranged in ascending order?',
      'answers': [
        {'text': 'None', 'score': 0},
        {'text': 'One', 'score': 0},
        {'text': 'Two', 'score': 0},
        {'text': 'Three', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Quizzzz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
