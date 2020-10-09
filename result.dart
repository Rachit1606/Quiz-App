import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore <= 2 && resultScore > 0) {
      resultText = 'You did it With Grade C';
    } else if (resultScore <= 4 && resultScore > 2) {
      resultText = 'You did it With Grade B';
    } else if (resultScore <= 6 && resultScore > 4) {
      resultText = 'You did it With Grade A';
    } else {
      resultText = 'Better Luck Next Time';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.red,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
