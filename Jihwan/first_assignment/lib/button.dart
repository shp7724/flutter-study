import 'package:flutter/material.dart';
import './main.dart';

class Button extends StatelessWidget {
  final int keypadnumber;
  final Function presshandler;
  final bool hasPressed;

  Button(this.keypadnumber, this.presshandler, this.hasPressed);

  @override
  Widget build(BuildContext context) {
    bool _hasPressed = false;
    return Container(
        child: Padding(
          padding: EdgeInsets.all(10),
            child: ButtonTheme(
                minWidth: 100,
                height: 50,
                child: RaisedButton(
                    child: Text(keypadnumber.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    onPressed: () {
                      _hasPressed = !_hasPressed;
                      // print(keypadnumber);
                      presshandler(keypadnumber);
                    },
                    color: hasPressed ? Colors.green : Colors.white))));
  }
}
