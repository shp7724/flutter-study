import 'package:flutter/material.dart';
import './main.dart';

class ResultCheck extends StatelessWidget {
  String inputtext;
  int inputlength;

  ResultCheck(this.inputtext, this.inputlength);

  String outputtext;

  void setoutputtext() {
    if (this.inputtext == '123456789') {
      outputtext = 'Lock open';
    } else {
      outputtext = 'Locked';
    }
  }

  @override
  Widget build(BuildContext context) {
    setoutputtext();
    return Container(
      child: Text(outputtext,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: inputlength == 9 ? Colors.black : Colors.white
          )),
    );
  }
}
