import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function Rest;
  final _totalScore;
  final _tota;

  String get resultPhrase {
    String getResult;
    if (_totalScore >= 120) {
      getResult = "you are excellent";
    } else if (_totalScore >= 60) {
      getResult = "you are very good";
    } else {
      getResult = "you are bad";
    }
    return getResult;
  }

  Result(this.Rest, this._totalScore, this._tota);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score is : $_tota",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "$resultPhrase",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              //color: Colors.orange,
              onPressed: Rest,
              child: Text(
                "Restart The App",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                ),
              ))
        ],
      ),
    );
  }
}
